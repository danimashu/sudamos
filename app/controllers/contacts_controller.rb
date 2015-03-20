class ContactsController < InheritedResources::Base
  actions :create
  belongs_to :advert, :user, optional: true

  def create
    create! do |success, failure|
      failure.html { redirect_to [parent], alert: t("flash.contacts.create.alert") }
    end
  end
end