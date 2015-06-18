require "spec_helper"

describe Subscriber do
  it { should allow_mass_assignment_of(:email) }
  it { should validate_presence_of(:email) }
  %w(abc @abc.com a@.com @c0m).each do |string|
    it { should_not allow_value(string).for(:email) }
  end
  %w(example@example.com 1a@a.com a@2a.net).each do |string|
    it { should allow_value(string).for(:email) }
  end
end
