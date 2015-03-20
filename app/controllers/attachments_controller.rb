class AttachmentsController < InheritedResources::Base
  actions :show
  respond_to :js
  layout nil
end
