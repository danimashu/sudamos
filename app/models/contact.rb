class Contact < ActiveRecord::Base
  attr_accessible :email, :message, :newsletter
  validates :email, :message, presence: true
  validates :email, format: { with: Devise.email_regexp }

  belongs_to :user
  belongs_to :advert

  after_create :send_email
  after_create :set_user_id

  scope :pending_read, -> { where(read: false) }

  def read!
    update_attribute :read, true
  end

  protected

  def set_user_id
    update_attribute :user_id, advert.user.id if advert.present?
  end

  def send_email
    if advert.present?
      UserMailer.contact_with_advert(self).deliver
    else
      UserMailer.contact_with_user(self).deliver
    end
  end
end
