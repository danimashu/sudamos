require 'spec_helper'

describe Admin::ArticlesController do
  let(:article) { create :article }

  context "while admin logged in" do
    before { authenticate_admin_via_http }

    describe "on GET to index" do
      before { get :index }
      it { should respond_with(:success) }
    end

    describe "on GET to new" do
      before { get :new }
      it { should respond_with(:success) }
    end

    describe "on GET to edit" do
      before { get :edit, id: article.id }
      it { should respond_with(:success) }
    end

  end

  context "while not logged in" do
    describe "on GET to index" do
      before { get :index }
      it { should respond_with(:unauthorized) }
    end
  end

end
