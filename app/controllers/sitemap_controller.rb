class SitemapController < ApplicationController

  def sitemap
    request.format = "xml"
    respond_to do |format|
      format.xml
    end
  end

end