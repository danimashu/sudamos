class UsersController < InheritedResources::Base
  actions :show

  before_filter :load_adverts

  protected

  def load_adverts
    @adverts = resource.adverts.active
  end
end