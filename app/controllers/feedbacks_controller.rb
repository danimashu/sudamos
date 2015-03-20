class FeedbacksController < InheritedResources::Base
  set_tab :contact_with_us, :public
  actions :new, :create
  layout "basic"
end
