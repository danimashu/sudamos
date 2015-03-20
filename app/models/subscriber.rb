class Subscriber < ActiveRecord::Base
  attr_accessible :email
  validates :email, presence: true
  validates :email, format: { with: Devise.email_regexp }
end
