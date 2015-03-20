module AdvertsSteps
  step "the visitor can see the advert listed" do
    visit "/"
    within("nav") { click_link "Anuncios" }
    page.should have_content(@advert.title.upcase)
  end

  step "the visitor can filter by the state" do
    select @advert.state.name, from: "q_state_search_term_eq"
    page.should have_content(@advert.title.upcase)
  end

  step "the visitor can see the detail of an advert" do
    visit "/"
    within("nav") { click_link "Anuncios" }
    click_link @advert.title
    page.should have_content(@advert.title.upcase)
    page.should have_content(@advert.price)
    page.should have_content(@advert.phone)
  end
end

RSpec.configure{ |c| c.include AdvertsSteps }