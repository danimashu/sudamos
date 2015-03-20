class User::Base < InheritedResources::Base
  set_tab :user
  before_filter :authenticate_user!
  layout "basic"
end
