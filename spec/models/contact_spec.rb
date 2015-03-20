require 'spec_helper'

describe Contact do
  %w(email message newsletter).each do |attr|
    it { should allow_mass_assignment_of(attr) }
  end
  it { should_not allow_mass_assignment_of(:advert_id) }

  %w(email message).each do |attr|
    it { should validate_presence_of(attr) }
  end

  %w{abc @abc.com a@.com @c0m}.each do |string|
    it { should_not allow_value(string).for(:email) }
  end

  %w{example@example.com 1a@a.com a@2a.net}.each do |string|
    it { should allow_value(string).for(:email) }
  end

  it { should belong_to(:user) }
  it { should belong_to(:advert) }
end
