class User::ContactsController < User::Base
  set_tab :contacts, :user
  actions :index
  respond_to :js, only: :read

  def read
    resource.read!
  end

  protected

  def begin_of_association_chain
    current_user
  end
end
