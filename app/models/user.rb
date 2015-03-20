class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable,:omniauthable, omniauth_providers: [:facebook]

  attr_accessible :email, :password, :password_confirmation, :remember_me, :terms,
    :professional, :name, :state_id, :phone, :address, :company_description, :provider, :uid
  attr_accessor :terms

  validates :terms, acceptance: true
  validates :professional, inclusion: { in: [false, true] }
  validates :name, presence: true

  belongs_to :state
  has_many :adverts, dependent: :destroy
  has_many :contacts

  def self.find_for_facebook_oauth(auth)
    email = auth.present? ? auth.info.email : nil
    user = User.where(email: email).first
    unless user.present?
      user = User.create name: [auth.extra.raw_info.first_name, auth.extra.raw_info.last_name].join(" "),
               provider: "facebook", uid: auth.uid, email: email, password: Devise.friendly_token[0,20]
    end
    user
  end
end
