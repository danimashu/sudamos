module ContactsSteps
  step "the visitor can contact with the advert" do
    visit "/"
    within("nav") { click_link "Anuncios" }
    click_link @advert.title
    @contact = build :contact
    fill_in "contact_email", with: @contact.email
    fill_in "contact_message", with: @contact.message
    click_button "Send"
    page.should have_content("Contact was successfully created.")
  end

  step "the user receives an email" do
    unread_emails_for(@user.email).size.should eq(1)
    open_last_email
    current_email.should deliver_from('"sudamos.es" <hola@sudamos.es>')
    current_email.should deliver_to(@user.email)
    current_email.should reply_to(@contact.email)
  end

  step "the visitor can contact with the user" do
    visit "/"
    within("nav") { click_link "Anuncios" }
    click_link @advert.title
    click_link @user.name
    @contact = build :contact
    fill_in "contact_email", with: @contact.email
    fill_in "contact_message", with: @contact.message
    click_button "Send"
    page.should have_content("Contact was successfully created.")
  end
end

RSpec.configure{ |c| c.include ContactsSteps }