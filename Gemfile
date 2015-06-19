source "http://rubygems.org"

ruby File.read(".ruby-version").strip

gem "rails", "4.1.11"

gem "haml-rails"
gem "mysql2"

gem "asset_sync"
gem "coffee-rails", "~> 4.0.0"
gem "jquery-rails"
gem "jquery.fileupload-rails"
gem "less-rails"
gem "less-rails-bootstrap"
gem "sass"
gem "therubyracer"
gem "uglifier", ">= 1.3.0"

gem "devise"
gem "omniauth-facebook"

gem "aws-sdk"
gem "transloadit-rails"

gem "actionpack-action_caching"
gem "devise-i18n"
gem "friendly_id", "~> 5.0.0"
gem "high_voltage"
gem "inherited_resources"
gem "kaminari"
gem "mail_form"
gem "meta-tags"
gem "protected_attributes"
gem "rails-i18n"
gem "ransack", github: "activerecord-hackery/ransack", branch: "rails-4.1"
gem "redcarpet"
gem "simple_form"
gem "tabs_on_rails"
gem "figaro"

gem "rollbar", "~> 1.4.4"
gem "newrelic_rpm"

group :production do
  gem "unicorn"
end

group :development, :test do
  gem "byebug"
  gem "factory_girl_rails"
  gem "faker"
  gem "fivemat"
  gem "mailcatcher"
  gem "rspec-rails", "~> 2.14.2"
  gem "sqlite3"
end

group :development do
  gem "gem-open"
  gem "rubocop", require: false
end

group :test do
  gem "capybara"
  gem "capybara-webkit"
  gem "poltergeist"
  gem "database_cleaner"
  gem "email_spec"
  gem "fakeweb"
  gem "launchy"
  gem "shoulda"
  gem "timecop"
  gem "turnip"
  gem "codeclimate-test-reporter", require: nil
end
