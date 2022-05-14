require "rails_helper"

RSpec.describe GeocoordinatesHelper do
  it "calculates the correct distance" do
    expect(described_class.distance_between(30, 30, -10, -10)).to eq(6_170_508)
  end
end
