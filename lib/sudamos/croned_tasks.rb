module Sudamos
  class CronedTasks
    def self.inform_advert_near_to_expire
      INFORM_EXPIRE_DAYS.each do |days|
        Advert.not_retired.renewed_at_day(days.ago).each do |advert|
          UserMailer.inform_advert_near_to_expire(advert).deliver
        end
      end
    end

    def self.inform_posibility_of_renew
      INFORM_RENEW_DAYS.each do |days|
        Advert.not_retired.renewed_at_day(days.ago).each do |advert|
          UserMailer.inform_posibility_of_renew(advert).deliver
        end
      end
    end

    def self.inform_advert_without_image
      INFORM_NO_IMAGE_DAYS.each do |days|
        Advert.created_at_day(days.ago).not_retired.not_imaged.each do |advert|
          UserMailer.inform_advert_without_image(advert).deliver
        end
      end
    end
  end
end
