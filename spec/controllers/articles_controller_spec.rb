require 'spec_helper'

describe ArticlesController do
  let(:article) { create :article }

  describe "on GET to index" do
    before { get :index }
    it { should respond_with(:success) }
  end

  describe "on GET to show" do
    before { get :show, id: article.id }
    it { should respond_with(:success) }
  end
end
