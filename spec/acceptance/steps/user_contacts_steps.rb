module UserContactsSteps
  step "the user can see a list of general contacts" do
    find(".navbar-nav a.dropdown-toggle").click
    click_link "Mensajes"
    within("##{dom_id(@contact)}") do
      page.should have_content(@contact.message)
      page.should have_content(@contact.email)
    end
    within("##{dom_id(@contact_user)}") do
      page.should have_content(@contact_user.message)
      page.should have_content(@contact_user.email)
    end
  end

  step "the user can see a list of adverts contacts" do
    find(".navbar-nav a.dropdown-toggle").click
    click_link "Mis anuncios"
    within("##{dom_id(@advert)}") do
      find("a[href*=contact]").click
    end
    page.should have_css("##{dom_id(@contact)}")
    page.should_not have_css("##{dom_id(@contact_user)}")
  end
  
  step "the user can mark as read the contact" do
    click_link "Marcar como leído"
    page.should have_content @contact.message
    page.should_not have_content "Marcar como leído"
  end
end

RSpec.configure{ |c| c.include UserContactsSteps }
