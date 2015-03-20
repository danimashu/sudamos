require 'spec_helper'

describe AttachmentsController do
  before do
    @advert = create :advert
    @attachment = create :attachment
  end

  describe "on GET to show with html" do
    before { get :show, advert_id: @advert.id, id: @attachment.id }
    it { should respond_with(:success) }
  end

  describe "on GET to show with html" do
    before { xhr :get, :show, advert_id: @advert.id, id: @attachment.id, format: :js }
    it { should respond_with(:success) }
  end
end
