class User::Base < InheritedResources::Base
  set_tab :user
  before_action :authenticate_user!
  layout "basic"
end
