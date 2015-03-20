class UserMailer < ActionMailer::Base
  default from: "\"sudamos.es\" <hola@sudamos.es>"
  layout "email"

  def contact_with_advert contact
    @contact = contact
    @advert = contact.advert
    @user = @advert.user

    mail reply_to: @contact.email,
         to: @advert.user.email,
         subject: t("mailer.subject.contact_with_advert", title: @advert.title)
  end

  def contact_with_user contact
    @contact = contact
    @user = contact.user

    mail reply_to: @contact.email,
         to: @user.email,
         subject: t("mailer.subject.contact_with_user")
  end

  def inform_advert_near_to_expire advert
    @advert = advert
    @user = @advert.user

    mail to: @user.email,
         subject: t("mailer.subject.inform_advert_near_to_expire")
  end

  def inform_posibility_of_renew advert
    @advert = advert
    @user = @advert.user

    mail to: @user.email,
         subject: t("mailer.subject.inform_posibility_of_renew")
  end

  def inform_advert_without_image advert
    @advert = advert
    @user = @advert.user

    mail to: @user.email,
         subject: t("mailer.subject.inform_advert_without_image")
  end
end
