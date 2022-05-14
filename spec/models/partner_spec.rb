require "rails_helper"

RSpec.describe Partner, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:experience) }
  it { is_expected.to validate_presence_of(:lat) }
  it { is_expected.to validate_presence_of(:lon) }
  it { is_expected.to validate_presence_of(:operating_radius) }
  it { is_expected.to validate_presence_of(:rating) }
end
