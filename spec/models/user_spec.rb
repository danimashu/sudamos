require "spec_helper"

describe User do
  %w(
    email password password_confirmation remember_me terms professional
    name state_id phone address company_description provider uid
  ).each do |attr|
    it { should allow_mass_assignment_of(attr) }
  end
  it { should validate_presence_of(:name) }
  it { should validate_acceptance_of(:terms) }

  it { should belong_to(:state) }
  it { should have_many(:adverts).dependent(:destroy) }
  it { should have_many(:contacts) }

  describe ".find_for_facebook_oauth" do
    before { @user = create :user, email: "daniel@gmail.com" }

    context "when the email exists" do
      user_info = OmniAuth::AuthHash.new(
        info: { email: "daniel@gmail.com" },
        extra: { raw_info: { first_name: "Daniel", last_name: "Madrid" } })
      it { User.find_for_facebook_oauth(user_info).should eq(@user) }
    end

    context "when the email doesn't exist" do
      user_info = OmniAuth::AuthHash.new(
        info: { email: "danielon@gmail.com" },
        extra: { raw_info: { first_name: "Daniel", last_name: "Madrid" } })
      it "creates a new user" do
        User.find_for_facebook_oauth(user_info).should_not eq(@user)
        User.last.email.should eq("danielon@gmail.com")
        User.last.name.should eq("Daniel Madrid")
        User.last.provider.should eq("facebook")
      end
    end

    context "when the email is not valid or blank" do
      user_info = OmniAuth::AuthHash.new(
        info: { email: "invalid" },
        extra: { raw_info: { first_name: "Daniel", last_name: "Madrid" } })
      it { User.find_for_facebook_oauth(user_info).persisted?.should be_false }
    end
  end
end
