class MatchingPartnersQuery
  def initialize(filter_params)
    @service = filter_params["service"]
    @lat = filter_params["lat"].to_f
    @lon = filter_params["lon"].to_f
  end

  def call
    validate_geodata(lat, lon)

    partners = Partner.all
    partners = filter_by_service(partners)
    partners = filter_by_distance(partners)
    sort_by_best_match(partners)
  end

  private

  attr_reader :service, :lat, :lon

  def filter_by_service(partners)
    partners.where("experience @> ?", "{#{service}}")
  end

  def filter_by_distance(partners)
    partners.reject do |p|
      p.operating_radius < GeocoordinatesHelper.distance_between(
        p.lat, p.lon, lat, lon
      )
    end
  end

  def sort_by_best_match(partners)
    partners.sort do |a, b|
      if a.rating == b.rating
        a.distance_to_target(lat, lon) <=> b.distance_to_target(lat, lon)
      else
        b.rating <=> a.rating
      end
    end
  end

  def validate_geodata(lat, lon)
    return if lat.present? && lon.present? &&
      lat.between?(-90.0, 90.0) && lon.between?(-180.0, 180.0)

    raise ArgumentError,
      "Expected valid geocoordinates (latitude between -90 to 90,"\
      "longitude between -180 to 180)."
  end
end
