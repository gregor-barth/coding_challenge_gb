module GeocoordinatesHelper
  # Calculate the distance between two points on the earth surface using the
  # haversine formula.
  # see: https://en.wikipedia.org/wiki/Haversine_formula
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Layout/LineLength
  def self.distance_between(lat1, lon1, lat2, lon2)
    rad_per_deg = Math::PI / 180
    earth_radius_m = 6_371_000 # in meters

    # convert to radians
    lat1_rad = lat1 * rad_per_deg
    lat2_rad = lat2 * rad_per_deg
    lon1_rad = lon1 * rad_per_deg
    lon2_rad = lon2 * rad_per_deg

    delta_lat_rad = (lat2_rad - lat1_rad)
    delta_lon_rad = (lon2_rad - lon1_rad)

    a = (Math.sin(delta_lat_rad / 2)**2) + (Math.cos(lat1_rad) * Math.cos(lat2_rad) * (Math.sin(delta_lon_rad / 2)**2))
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))

    # distance in meters
    (earth_radius_m * c).round
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Layout/LineLength
end
