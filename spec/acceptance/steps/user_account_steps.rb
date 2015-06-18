module UserAccountSteps
  step "a signed in user" do
    step "a registered user"
    step "the user can sign in"
  end

  step "an unregistered user" do
    visit "/"
  end

  step "the user sign up as particular" do
    user = build :user
    click_link "Iniciar sesión"
    click_link "Sign up"
    fill_in "Name", with: user.name
    fill_in "Email", with: user.email
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    check "user_terms"
    click_button "Sign up"
  end

  step "the user sign up as professional" do
    user = build :user
    click_link "Iniciar sesión"
    click_link "Sign up"
    choose "user_professional_true"
    fill_in "Name", with: user.name
    fill_in "Email", with: user.email
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    check "user_terms"
    click_button "Sign up"
  end

  step "the user can see his account created" do
    page.should have_content("Welcome! You have signed up successfully.")
    find(".navbar-nav a.dropdown-toggle").click
    page.should have_content("Log out")
  end

  step "the user can sign in" do
    visit "/"
    click_link "Iniciar sesión"
    fill_in "Email", with: @user.email
    fill_in "Password", with: "123456"
    click_button "Sign in"
    page.should have_content("Signed in")
  end

  step "the user can sign out" do
    find(".navbar-nav a.dropdown-toggle").click
    click_link "Log out"
  end

  step "the user can edit his profile" do
    find(".navbar-nav a.dropdown-toggle").click
    click_link "Editar perfil"
    choose "user_professional_true"
    fill_in "Company description", with: "Company description"
    click_button "Update User"
    page.should have_content("User was successfully updated.")
    find("#user_company_description").text.should eq("Company description")
  end

  step "the user forget a password" do
    visit "/"
    click_link "Iniciar sesión"
    click_link "Forgot your password?"
    fill_in "Email", with: @user.email
    click_button "Password recovery"
  end

  step "the user can reset the password" do
    current_path.should eq(new_user_session_path)
    open_last_email
    click_first_link_in_email
    fill_in "New password", with: "1234567"
    fill_in "Password confirmation", with: "1234567"
    click_button "Change password"
    current_path.should eq(user_adverts_path)
    page.should have_content("Your password was changed successfully. You are now signed in.")
    step "the user can sign out"
    visit "/"
    click_link "Iniciar sesión"
    fill_in "Email", with: @user.email
    fill_in "Password", with: "1234567"
    click_button "Sign in"
    page.should have_content("Signed in")
  end

  step "the user can sign in throught Facebook for an existing account" do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      info: { email: @user.email },
      provider: :facebook,
      uid: "123456",
      extra: { raw_info: { first_name: "Alice", last_name: "Ecila" } }
    )
    reset_mailer

    visit "/"
    click_link "Iniciar sesión"
    click_link "Iniciar sesión con Facebook"
    page.should have_content("Successfully authorized from Facebook account.")
    page.should have_content("Mi cuenta")
  end

  step "the user can sign in throught Facebook for a new account" do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      info: { email: "alice@gmail.com" },
      provider: :facebook,
      uid: "123456",
      extra: { raw_info: { first_name: "Alice", last_name: "Ecila" } }
    )

    click_link "Iniciar sesión"
    click_link "Iniciar sesión con Facebook"
    page.should have_content("Successfully authorized from Facebook account.")
    page.should have_content("Mi cuenta")
  end

  step "the user cannot sign in throught Facebook for not real email" do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      info: { email: "invalid" },
      provider: :facebook,
      uid: "123456",
      extra: { raw_info: { first_name: "Alice", last_name: "Ecila" } }
    )

    visit "/"
    click_link "Iniciar sesión"
    click_link "Iniciar sesión con Facebook"
    page.should_not have_content("Hello")
  end

  step "the user cannot sign in throught Facebook for wrong response" do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials

    click_link "Iniciar sesión"
    click_link "Iniciar sesión con Facebook"
    page.should have_content("Could not authorize you from Facebook
                             because \"Invalid credentials\"")
  end
end

RSpec.configure { |c| c.include UserAccountSteps }
