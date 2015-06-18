require "spec_helper"

describe Attachment do
  subject { create :attachment }

  it { should_not allow_mass_assignment_of(:advert_id) }
  it { should_not allow_mass_assignment_of(:main) }

  it { should validate_presence_of(:advert_id) }
  it { should belong_to(:advert) }

  before { @advert = create :advert }

  describe "max attachments" do
    before { create_list :attachment, MAX_ATT, advert: @advert.reload }

    it "should not allow create another" do
      expect { create(:attachment, advert: @advert.reload) }.to raise_error
    end
  end

  describe "#main_image!" do
    before do
      @att1 = create :attachment, advert: @advert, main: true
      @att2 = create :attachment, advert: @advert
      @att2.main_image!
    end

    it "should become to the main image" do
      @att1.reload.main?.should be_false
      @att2.reload.main?.should be_true
    end

    context "after another main image" do
      before { @att2.main_image! }

      it "should become to the main image" do
        @att1.reload.main?.should be_false
        @att2.reload.main?.should be_true
      end
    end
  end
end
