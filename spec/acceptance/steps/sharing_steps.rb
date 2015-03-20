module SharingSteps
  step "the visitor can share an advert" do
    visit "/anuncios"
    click_link @advert.title
    page.should have_css(".addthis_sharing_toolbox")
  end

  step "the visitor can share an article" do
    visit "/"
    click_link "Blog"
    click_link @article.title
    page.should have_css(".addthis_sharing_toolbox")
  end
end

RSpec.configure{ |c| c.include SharingSteps }