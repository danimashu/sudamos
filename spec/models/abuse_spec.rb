require 'spec_helper'

describe Abuse do
  it { should_not allow_mass_assignment_of(:advert_id) }
  it { should validate_presence_of(:advert_id) }

  it { should belong_to(:advert) }
end
