class AbusesController < InheritedResources::Base
  actions :create
  belongs_to :advert

  def create
    create! { [parent] }
  end
end
