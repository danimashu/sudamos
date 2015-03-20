class User::AdvertContactsController < User::Base
  defaults resource_class: Contact, collection_name: "contacts"
  set_tab :adverts, :user
  actions :index
  belongs_to :advert
end
