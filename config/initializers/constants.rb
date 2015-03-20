#    ADVERT_TITLE_SIZE: Size in chars of the avert's title
#              MAX_ATT: Max images allowed for each advert
#       RENEW_INTERVAL: Min time allowed between two renewals
#          EXPIRE_TIME: Time counted from the last renew for unpublish the advert
#   INFORM_EXPIRE_DAYS: Array of days, counted from the last renew, in which the app will inform via email that the advert is near to expire
#    INFORM_RENEW_DAYS: Array fo days, counted from the last renew, in which the app will inform via email that the advert can be renewed
# INFORM_NO_IMAGE_DAYS: Array of days, counted from the creation time, in which the app will inform via email that the advert has no images

if Rails.env.production?
  ADVERT_TITLE_SIZE    = 38
  MAX_ATT              = 6
  RENEW_INTERVAL       = 22.hours
  EXPIRE_TIME          = 300.days
  INFORM_EXPIRE_DAYS   = [250.days, 290.days]
  INFORM_RENEW_DAYS    = [5.days, 15.days, 25.days, 35.days]
  INFORM_NO_IMAGE_DAYS = [1.days, 10.days, 20.days, 30.days]
else
  ADVERT_TITLE_SIZE    = 38
  MAX_ATT              = 2
  RENEW_INTERVAL       = 5.minutes
  EXPIRE_TIME          = 10.days
  INFORM_EXPIRE_DAYS   = [8.days, 9.days]
  INFORM_RENEW_DAYS    = [3.days, 5.days]
  INFORM_NO_IMAGE_DAYS = [1.day, 2.days]
end
