require 'spec_helper'

describe Sudamos::CronedTasks do
  describe "inform near to expire advert" do
    before do
      Timecop.travel(INFORM_EXPIRE_DAYS[0].ago) do
        @advert1 = create :advert
      end
      Timecop.travel(INFORM_EXPIRE_DAYS[1].ago) do
        @advert2 = create :advert
      end
      @advert3 = create :advert

      Sudamos::CronedTasks.inform_advert_near_to_expire
    end

    it "should send email to the adverts inside his expire inform day" do
      unread_emails_for(@advert1.user.email).size.should eq(1)
      unread_emails_for(@advert2.user.email).size.should eq(1)
    end

    it "should not send the email to the non into inform day advert" do
      unread_emails_for(@advert3.user.email).size.should eq(0)
    end
  end

  describe "inform posibility of renew" do
    before do
      Timecop.travel(INFORM_RENEW_DAYS[0].ago) do
        @advert1 = create :advert
      end
      Timecop.travel(INFORM_RENEW_DAYS[1].ago) do
        @advert2 = create :advert
      end
      @advert3 = create :advert

      Sudamos::CronedTasks.inform_posibility_of_renew
    end

    it "should send email to the adverts inside his renew inform day" do
      unread_emails_for(@advert1.user.email).size.should eq(1)
      unread_emails_for(@advert2.user.email).size.should eq(1)
    end

    it "should not send the email to the non into inform day advert" do
      unread_emails_for(@advert3.user.email).size.should eq(0)
    end
  end

  describe "inform the advert have no image" do
    before do
      Timecop.travel(INFORM_NO_IMAGE_DAYS[0].ago) do
        @advert1 = create :advert
      end
      Timecop.travel(INFORM_NO_IMAGE_DAYS[1].ago) do
        @advert2 = create :advert
        @advert3 = create :advert
        create :attachment, advert: @advert3
      end
      @advert4 = create :advert

      Sudamos::CronedTasks.inform_advert_without_image
    end

    it "should send email to the adverts inside his inform day without images" do
      unread_emails_for(@advert1.user.email).size.should eq(1)
      unread_emails_for(@advert2.user.email).size.should eq(1)
    end

    it "should not send the email to the non into inform day advert or with images" do
      unread_emails_for(@advert3.user.email).size.should eq(0)
      unread_emails_for(@advert4.user.email).size.should eq(0)
    end
  end
end
