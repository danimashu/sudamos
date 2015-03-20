module UserAdvertsSteps
  step "the user can create an advert" do
    within("nav") { click_link "Publicar anuncio" }
    fill_in "advert_title", with: "Vendo tabla surf"
    fill_in "advert_description", with: "Descripcion tabla"
    select "Asturias", from: "advert_state_id"
    select "Material", from: "advert_section_id"
    select "Surf", from: "advert_sport_id"
    click_button "Next step"
  end

  step "the user can add images" do
    # TODO add images
    click_link "Finalizar"
  end

  step "the advert is listed in the user adverts list" do
    find(".navbar-nav a.dropdown-toggle").click
    click_link "Mis anuncios"
    page.should have_content("Vendo tabla surf")
  end

  step "the advert is listed in the adverts list" do
    visit "/"
    within("nav") { click_link "Anuncios" }
    page.should have_content("Vendo tabla surf".upcase)
  end

  step "the user can edit the advert" do
    find(".navbar-nav a.dropdown-toggle").click
    click_link "Mis anuncios"
    within("##{dom_id(@advert)}") do
      find("a.dropdown-toggle").click
      click_link "Edit"
    end
    fill_in "advert_title", with: "Vendo tabla surff"
    click_button "Update Advert"
    page.should have_content("Vendo tabla surff")
  end

  step "the user can edit the images" do
    # TODO images
  end

  step "the user can retire the advert" do
    find(".navbar-nav a.dropdown-toggle").click
    click_link "Mis anuncios"
    within("##{dom_id(@advert)}") do
      find("a.dropdown-toggle").click
      click_link "Remove"
    end
  end

  step "the advert is not shown in the list" do
    visit "/anuncios"
    page.should_not have_content(@advert.title)
    @advert.reload.retired.should be_true
  end

  step "the user can renew the advert" do
    find(".navbar-nav a.dropdown-toggle").click
    click_link "Mis anuncios"
    within("##{dom_id(@advert)}") do
      find("a.dropdown-toggle").click
      click_link "Renew"
    end
    page.should have_content("You will can renew the advert in 5 minutes.")
    @advert.update_column :renewed_at, 15.minutes.ago
    within("##{dom_id(@advert)}") do
      find("a.dropdown-toggle").click
      click_link "Renew"
    end
    page.should have_content("You have renewed your advert.")
  end

end

RSpec.configure{ |c| c.include UserAdvertsSteps }