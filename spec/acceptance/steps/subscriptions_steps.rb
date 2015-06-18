module SubscriptionsSteps
  step "a visitor on the platform" do
    visit "/"
  end

  step "the visitor can subscribe to the newsletter" do
    fill_in "subscriber_email", with: "foxmulder@xfiles.com"
    click_button "Subscribirse"
    page.should have_content("Subscriber was successfully created.")
  end
end

RSpec.configure { |c| c.include SubscriptionsSteps }
