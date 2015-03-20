class Abuse < ActiveRecord::Base
  attr_accessible
  validates_presence_of :advert_id

  belongs_to :advert, counter_cache: true
end
