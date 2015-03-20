class User::UsersController < User::Base
  set_tab :config, :user
  actions :edit, :update

  def update
    update! { [:edit, :user, :user] }
  end

  protected

  def resource
    current_user
  end
end
