require "spec_helper"

describe Article do
  %w(title teaser body published thumbnail_link).each do |attr|
    it { should allow_mass_assignment_of(attr) }
  end

  %w(title teaser body thumbnail_link).each do |attr|
    it { should validate_presence_of(attr) }
  end
end
