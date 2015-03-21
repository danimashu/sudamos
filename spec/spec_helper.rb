require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

require 'email_spec'
require 'shoulda'
require 'shoulda/matchers/integrations/rspec'
require 'turnip/capybara'

require "support/helpers"

Dir[Rails.root.join("spec/acceptance/steps/*_steps.rb")].each { |f| require f }

Capybara.register_driver :webkit do |app|
  Capybara::Webkit::Driver.new(app).tap do |driver|
    driver.block_unknown_urls
  end
end

Capybara.default_driver = :webkit
Capybara.javascript_driver = :webkit

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, type: :controller
  config.include EmailSpec::Helpers
  config.include EmailSpec::Matchers
  config.include ActionView::RecordIdentifier
  config.include Helpers

  config.mock_with :rspec
  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with :truncation
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
