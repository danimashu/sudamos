require 'spec_helper'

describe State do
  it { should have_many(:adverts) }

  it { should validate_presence_of(:name) }
end
