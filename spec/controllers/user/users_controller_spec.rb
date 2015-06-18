require "spec_helper"

describe User::UsersController do
  before do
    @user = create :user
  end

  context "while logged in" do
    before { sign_in @user }

    describe "on GET to edit" do
      before { get :edit }
      it { should respond_with(:success) }
    end

    describe "on PUT to update" do
      before { put :update, user: attributes_for(:user) }
      it { should respond_with(:found) }
    end
  end

  context "while not logged in" do
    describe "on GET to edit" do
      before { get :edit }
      it { should redirect_to(new_user_session_path) }
    end
  end
end
