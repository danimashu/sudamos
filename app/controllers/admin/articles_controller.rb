class Admin::ArticlesController < InheritedResources::Base
  set_tab :admin
  set_tab :articles, :admin
  actions :all, except: :show
  before_filter :authenticate!
end
