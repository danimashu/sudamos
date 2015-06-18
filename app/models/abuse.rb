class Abuse < ActiveRecord::Base
  attr_accessible
  validates :advert_id, presence: true

  belongs_to :advert, counter_cache: true
end
