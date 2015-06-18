require "spec_helper"

describe SitemapController do
  describe "on GET to sitemap" do
    before { get :sitemap }
    it { should respond_with(:success) }
  end
end
