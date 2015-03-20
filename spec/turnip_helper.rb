RSpec.configure do |config|
  config.before(seed: true) do
    load "support/seed.rb"
  end
end