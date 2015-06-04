module LocationsHelper
  # Parse the API data to store it in an array of hashes -
  # each bus will be a hash.
  def fetch_api_data source
    http = Net::HTTP.get_response(URI.parse(source))
    data = http.body
    JSON.parse(data)
  end

  # Compare lat/long of bus versus user and return whether within
  # 0.01 degrees (true/false)
  def is_nearby(lat_user, long_user, lat_bus, long_bus)
    (lat_user - lat_bus).abs <= 0.01 && (long_user - long_bus).abs <= 0.01
  end

end
