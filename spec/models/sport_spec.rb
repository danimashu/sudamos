require "spec_helper"

describe Sport do
  it { should validate_presence_of(:name) }
end
