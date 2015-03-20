module SeoHelper
  def title(page_title=nil)
    if page_title.nil?
      page_title = t("#{controller_name}.#{action_name}.title")
    end

    content_for :meta_title, page_title
    content_for :title, content_tag(:h1, page_title)
  end

  def adverts_title_text(collection)
    state = State.find_by_search_term(params[:state_search_term_eq])
    sport = Sport.find_by_search_term(params[:sport_search_term_eq])
    prefix = []
    prefix << "de #{sport.name.downcase}" if sport.present?
    prefix << "en #{state.name}" if state.present?
    "Anuncios #{prefix.join(' ')}"
  end

  def adverts_description_text(collection)
    state = State.find_by_search_term(params[:state_search_term_eq])
    sport = Sport.find_by_search_term(params[:sport_search_term_eq])
    prefix = []
    prefix << "de #{sport.name.downcase}" if sport.present?
    prefix << "en #{state.name}" if state.present?
    "Material #{prefix.join(' ')} de segunda mano. También puedes encontrar bicicletas de montaña, tablas de surf, camisetas de fútbol y más."
  end
end