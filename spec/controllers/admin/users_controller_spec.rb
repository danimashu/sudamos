require "spec_helper"

describe Admin::UsersController do
  let(:user) { create :user }

  context "while admin logged in" do
    before { authenticate_admin_via_http }

    describe "on GET to index" do
      before { get :index }
      it { should respond_with(:success) }
    end

    describe "on POST to become" do
      before { post :become, id: user.id }
      it { should redirect_to(user_adverts_path) }
    end
  end

  context "while not logged in" do
    describe "on GET to index" do
      before { get :index }
      it { should respond_with(:unauthorized) }
    end

    describe "on POST to become" do
      before { post :become, id: user.id }
      it { should respond_with(:unauthorized) }
    end
  end
end
