class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  attr_accessible :title, :teaser, :body, :published, :thumbnail_link

  validates :title, :teaser, :body, :thumbnail_link, presence: true

  scope :published, -> { where(published: true) }
  scope :important, -> { where(important: true) }
  scope :excluding, ->(article_id) { where("id != ?", article_id) }
  scope :random, -> { order("RAND()") }
  scope :desc, -> { order("created_at DESC") }

  scope :active, -> { published.desc }
  scope :spotlighted, -> { published.important.random }
end
