class UsersController < InheritedResources::Base
  actions :show

  before_action :load_adverts

  protected

  def load_adverts
    @adverts = resource.adverts.active
  end
end
