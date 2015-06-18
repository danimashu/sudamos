class ContactsController < InheritedResources::Base
  actions :create
  belongs_to :advert, :user, optional: true

  def create
    create! do |_success, failure|
      failure.html do
        redirect_to [parent], alert: t("flash.contacts.create.alert")
      end
    end
  end
end
