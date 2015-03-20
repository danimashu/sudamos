class Admin::UsersController < InheritedResources::Base
  set_tab :admin
  set_tab :users, :admin
  actions :index
  before_filter :authenticate!

  def become
    sign_in(:user, resource)
    redirect_to [:user, :adverts]
  end
end
