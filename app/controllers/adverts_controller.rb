class AdvertsController < InheritedResources::Base
  set_tab :adverts
  actions :index, :show

  before_action :increment_viewed_count, only: :show
  before_action :load_adverts, only: :index

  def searcher
    state = params[:q][:state_search_term_eq]
    sport = params[:q][:sport_search_term_eq]

    if state.present? && sport.present?
      redirect_to state_sport_search_adverts_path(state, sport)
    elsif state.present?
      redirect_to state_search_adverts_path(state)
    elsif sport.present?
      redirect_to sport_search_adverts_path(sport)
    else
      redirect_to adverts_path
    end
  end

  protected

  def load_adverts
    @search = Advert.search(
      state_search_term_eq: params[:state_search_term_eq],
      sport_search_term_eq: params[:sport_search_term_eq]
    )
    @adverts = @search.result(distinct: true).active.page(params[:page])
  end

  def increment_viewed_count
    resource.increment!(:viewed_count)
  end
end
