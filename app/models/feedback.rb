class Feedback < MailForm::Base
  attribute :email, validate: Devise.email_regexp
  attribute :message

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      subject: "Mensaje desde sudamos.es",
      to: "hola@sudamos.es",
      from: "hola@sudamos.es",
      reply_to: email
    }
  end
end
