class ArticlesController < InheritedResources::Base
  set_tab :articles
  actions :index, :show

  protected

  def collection
    end_of_association_chain.active.page(params[:page])
  end
end
