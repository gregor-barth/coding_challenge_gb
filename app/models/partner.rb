class Partner < ApplicationRecord
  validates :name, :experience, :lat, :lon, :operating_radius, :rating,
presence: true

  def distance_to_target(target_lat, target_lon)
    GeocoordinatesHelper.distance_between(lat, lon, target_lat, target_lon)
  end
end
