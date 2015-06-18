require "spec_helper"

describe AdvertsController do
  let(:advert) { create :advert }

  describe "on GET to index" do
    before { get :index }
    it { should respond_with(:success) }
  end

  describe "on GET to show" do
    before { get :show, id: advert.id }
    it { should respond_with(:success) }
  end

  describe "on POST to searcher" do
    before do
      post :searcher, q: {
        state_search_term_eq: "tarragona",
        sport_search_term_eq: "surf"
      }
    end
    it { should redirect_to "/anuncios/en-tarragona/de-surf" }
  end
end
