class Advert < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  def slug_candidates
    [:title, [:title, :state_name]]
  end

  attr_accessible :title, :description, :price, :sell, :state_id, :section_id, :phone, :sport_id
  validates :title, :description, :user_id, :state_id, :section_id, :sport_id, presence: true
  validates :price, numericality: true, allow_blank: true
  validates :phone, length: { minimum: 9 }, allow_blank: true
  validates :title, length: { maximum: ADVERT_TITLE_SIZE }

  belongs_to :user
  belongs_to :state, counter_cache: true
  belongs_to :section, counter_cache: true
  belongs_to :sport, counter_cache: true
  has_many :attachments
  has_many :contacts
  has_many :abuses

  delegate :name, to: :state, prefix: :state

  def main_attachment
    attachments.find_by_main(true) || attachments.first
  end

  scope :renewed_at_day, lambda { |date|
    where(renewed_at: (date.beginning_of_day..date.end_of_day))
  }
  scope :created_at_day, lambda { |date|
    where(created_at: (date.beginning_of_day..date.end_of_day))
  }

  scope :important, -> { where(important: true) }
  scope :not_retired, -> { where(retired: false) }
  scope :not_expired, -> { where("renewed_at > ?", EXPIRE_TIME.ago) }
  scope :expired, -> { where("renewed_at < ?", EXPIRE_TIME.ago) }
  scope :imaged, -> { where("attachments_count > 0") }
  scope :not_imaged, -> { where(attachments_count: 0) }
  scope :excluding, ->(advert_id) { where("id != ?", advert_id) }
  scope :random, -> { order("RAND()") }
  scope :desc, -> { order("created_at DESC") }
  scope :renewed_desc, -> { order("renewed_at DESC") }

  scope :spotlighted, -> { not_retired.imaged.important.random }
  scope :active, -> { not_retired.renewed_desc }

  after_create :set_date_fields

  def renew!
    return unless RENEW_INTERVAL.ago > renewed_at
    update_attribute :renewed_at, Time.zone.now
  end

  def retire!
    update_attribute :retired, true
  end

  protected

  def set_date_fields
    update_attribute :renewed_at, created_at
  end
end
