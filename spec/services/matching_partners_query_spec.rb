require "rails_helper"

RSpec.describe MatchingPartnersQuery do
  it "filters out partners without matching experiences" do
    partner = create(:partner)
    create(:partner, experience: ["tiles"])

    params = {
      "service" => "carpet",
      "lat" => partner.lat,
      "lon" => partner.lon
    }

    result = described_class.new(params).call

    expect(result).to eq([partner])
  end

  it "filters out partners which are not servicing the target area" do
    partner = create(:partner)
    create(:partner, lat: 10, lon: 10, operating_radius: 1)

    params = {
      "service" => "carpet",
      "lat" => partner.lat,
      "lon" => partner.lon
    }

    result = described_class.new(params).call

    expect(result).to eq([partner])
  end

  it "orders the partners by rating first and distance second" do
    partner1 = create(:partner, lat: 10, lon: 10, rating: 1)
    partner2 = create(:partner, lat: 10, lon: 10, rating: 5)
    partner3 = create(:partner, lat: 10, lon: 10.000001, rating: 5)

    params = {
      "service" => "carpet",
      "lat" => partner2.lat,
      "lon" => partner2.lon
    }

    result = described_class.new(params).call

    expect(result).to eq([partner2, partner3, partner1])
  end

  context "with invalid geodata" do
    it "raises an argument error" do
      params = {
        "service" => "carpet",
        "lat" => "5000",
        "lon" => "-300"
      }

      expect { described_class.new(params).call }.to raise_error(ArgumentError)
    end
  end
end
