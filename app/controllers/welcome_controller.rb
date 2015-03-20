class WelcomeController < ApplicationController
  def home
    @adverts = Advert.not_retired.imaged.important.desc.limit(12)
    @articles = Article.spotlighted.limit(4)
  end

  def homebike
    @adverts = Advert.search(sport_search_term_in: [
                        "bicicletas-de-montana",
                        "bicicletas-de-paseo",
                        "bicicletas-de-carretera"
                      ])
                     .result(distinct: true)
                     .not_retired.desc.limit(12)
    @articles = Article.spotlighted.limit(4)
  end
end