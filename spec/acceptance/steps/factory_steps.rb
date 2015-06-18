module FactorySteps
  step "a registered user" do
    @user ||= create :user
  end

  step "an advert created" do
    step "a registered user"
    @advert ||= create :advert, user: @user
  end

  step "an article created" do
    @article ||= create :article
  end

  step "a contact created" do
    step "an advert created"
    @contact ||= create :contact, advert: @advert
  end

  step "a contact to user created" do
    step "a registered user"
    @contact_user ||= create :contact, user: @user
  end
end

RSpec.configure { |c| c.include FactorySteps }
