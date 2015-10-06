class Station
  attr_reader :name, :lat, :long

  def initialize data_hash
    @name = data_hash["Name"]
    @lat  = data_hash["Lat"]
    @long = data_hash["Lon"]
    @code = data_hash["Code"]
  end

  def distance_to other_lat, other_long
    Haversine.distance(@lat, @long, other_lat, other_long).to_miles
  end

  def upcoming_trains
    r = HTTParty.get(
      "https://api.wmata.com/StationPrediction.svc/json/GetPrediction/#{@code}",
      headers: { "api_key" => "d311c928b8364eff80d7462f7938b2b1" }
    )
    r["Trains"]
  end

  def self.all_stations
    r = HTTParty.get(
      "https://api.wmata.com/Rail.svc/json/jStations",
      headers: { "api_key" => "d311c928b8364eff80d7462f7938b2b1" }
    )
    r["Stations"].map { |h| Station.new(h) }
  end

  def self.near lat, long
    close_stations = Station.all_stations.select do |station|
      station.distance_to(lat, long) < CLOSE_RADIUS
    end
    close_stations.sort_by { |s| s.distance_to(lat, long) }
  end
end
