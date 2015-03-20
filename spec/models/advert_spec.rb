require 'spec_helper'

describe Advert do
  %w(sport_id state_id section_id title description price sell phone).each do |attr|
    it { should allow_mass_assignment_of(attr) }
  end
  it { should_not allow_mass_assignment_of(:renewed_at) }
  it { should_not allow_mass_assignment_of(:user_id) }
  it { should_not allow_mass_assignment_of(:viewed_count) }

  %w(user_id sport_id state_id section_id title description).each do |attr|
    it { should validate_presence_of(attr) }
  end
  it { should validate_numericality_of(:price) }
  it { should allow_value(nil).for(:price) }
  it { should ensure_length_of(:title).is_at_most(ADVERT_TITLE_SIZE) }
  it { should ensure_length_of(:phone).is_at_least(9) }
  it { should allow_value(nil).for(:phone) }

  it { should belong_to(:user) }
  it { should belong_to(:sport) }
  it { should belong_to(:state) }
  it { should belong_to(:section) }
  it { should have_many(:attachments) }
  it { should have_many(:contacts) }
  it { should have_many(:abuses) }


  before do
    @advert = create :advert
    @advert.reload
  end
  subject { @advert }

  its(:viewed_count) { should eq(0) }
  its(:renewed_at) { should eq(@advert.created_at) }


  # RENEW METHOD

  describe "#renew!" do
    context "after create advert late enought" do
      before { Timecop.travel((RENEW_INTERVAL * 2).seconds.from_now) {@advert.renew!} }

      it "should allow the renew" do
        @advert.renewed_at.should_not eq(@advert.created_at)
      end
    end

    context "after create the advert but too soon" do
      before { Timecop.travel((RENEW_INTERVAL * 0.5).seconds.from_now) {@advert.renew!} }

      it "should not allow the renew" do
        @advert.renewed_at.should eq(@advert.created_at)
      end
    end

    context "after renew the advert late enought" do
      before do
        Timecop.travel((RENEW_INTERVAL * 2).seconds.from_now) { @advert.renew! }
        Timecop.travel((RENEW_INTERVAL * 4).seconds.from_now) { @advert.renew! }
      end

      it "should not allow the renew" do
        @advert.renewed_at.should > (RENEW_INTERVAL * 3).seconds.from_now
      end
    end

    context "after renew the advert too soon" do
      before do
        Timecop.travel((RENEW_INTERVAL * 2).seconds.from_now) { @advert.renew! }
        Timecop.travel((RENEW_INTERVAL * 2.5).seconds.from_now) { @advert.renew! }
      end

      it "should not allow the renew" do
        @advert.renewed_at.should < (RENEW_INTERVAL * 2.2).seconds.from_now
      end
    end
  end


  # ACTIVE SCOPE - SENSIBLE UPDATED AT - CHECKED BOOL

  describe ".active" do
    pending
  end


  # RENEWED AT DAY / CREATED AT DAY / EXPIRED SCOPES

  describe "expired scope" do
    before do
      Timecop.travel((EXPIRE_TIME * 2).seconds.ago) do
        @advert1 = create :advert
      end
      Timecop.travel((EXPIRE_TIME / 2).seconds.ago) do
        @advert2 = create :advert
      end
      @advert3 = create :advert
    end

    it "correctly scope for expire" do
      Advert.expired.should include(@advert1)
      Advert.expired.should_not include(@advert2)
      Advert.expired.should_not include(@advert3)
    end
  end

  describe "renewed at day scope" do
    before do
      Timecop.travel(1.days.ago) do
        @advert1 = create :advert
      end
      Timecop.travel(2.day.ago) do
        @advert2 = create :advert
      end
    end

    it "correctly scope 1 day ago" do
      Advert.renewed_at_day(1.day.ago).should include(@advert1)
      Advert.renewed_at_day(1.day.ago).should_not include(@advert2)
    end

    it "correctly scope 2 day ago" do
      Advert.renewed_at_day(2.day.ago).should_not include(@advert1)
      Advert.renewed_at_day(2.day.ago).should include(@advert2)
    end
  end

  describe "created at day scope" do
    before do
      Timecop.travel(1.days.ago) do
        @advert1 = create :advert
      end
      Timecop.travel(2.day.ago) do
        @advert2 = create :advert
      end
    end

    it "correctly scope 1 day ago" do
      Advert.created_at_day(1.day.ago).should include(@advert1)
      Advert.created_at_day(1.day.ago).should_not include(@advert2)
    end

    it "correctly scope 2 day ago" do
      Advert.created_at_day(2.day.ago).should_not include(@advert1)
      Advert.created_at_day(2.day.ago).should include(@advert2)
    end
  end


  # IMAGE SCOPES

  describe "imaged scope" do
    before do
      create :attachment, advert: @advert
      create :advert
    end

    it "should have created two adverts" do
      Advert.count.should eq(2)
    end

    it "should have only one imaged advert" do
      Advert.imaged.count.should eq(1)
      Advert.imaged.first.should eq(@advert)
    end
  end

  describe "not_imaged scope" do
    before do
      create :attachment, advert: @advert
      @advert_not_imaged = create :advert
    end

    it "should have created two adverts" do
      Advert.count.should eq(2)
    end

    it "should have only one no imaged advert" do
      Advert.not_imaged.count.should eq(1)
      Advert.not_imaged.first.should eq(@advert_not_imaged)
    end
  end
end