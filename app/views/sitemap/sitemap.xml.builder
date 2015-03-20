xml.instruct! :xml, version: "1.0"
xml.urlset xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9" do

  xml.url do
    xml.loc root_url
    xml.changefreq "daily"
  end

  xml.url do
    xml.loc homebike_url
    xml.changefreq "daily"
  end

  xml.url do
    xml.loc feedbacks_url
    xml.changefreq "daily"
  end

  User.all.each do |user|
    xml.url do
      xml.loc user_url(user)
      xml.changefreq "daily"
    end
  end

  xml.url do
    xml.loc adverts_url
    xml.changefreq "daily"
  end

  State.all.each do |state|
    xml.url do
      xml.loc state_search_adverts_url(state.search_term)
      xml.changefreq "daily"
    end
  end

  Advert.all.each do |advert|
    xml.url do
      xml.loc advert_url(advert)
      xml.changefreq "daily"
    end
  end

  Article.all.each do |article|
    xml.url do
      xml.loc article_url(article)
      xml.changefreq "daily"
    end
  end

end
