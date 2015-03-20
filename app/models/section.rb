class Section < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true

  has_many :adverts

  scope :asc, -> { order("name ASC") }

  before_create :set_search_term

  protected

  def set_search_term
    self.search_term = name.parameterize
  end
end
