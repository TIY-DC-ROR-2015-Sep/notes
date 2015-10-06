class BikeStation
  attr_reader :name, :lat, :long

  def initialize data_hash
    @name = data_hash["name"]
    @lat  = data_hash["lat"].to_f
    @long = data_hash["long"].to_f
    @num_bikes = data_hash["nbBikes"]
    @num_docks = data_hash["nbEmptyDocks"]
  end

  def distance_to other_lat, other_long
    Haversine.distance(@lat, @long, other_lat, other_long).to_miles
  end

  def self.all_stations
    r = HTTParty.get("http://www.capitalbikeshare.com/data/stations/bikeStations.xml")
    r["stations"]["station"].map { |h| BikeStation.new(h) }
  end

  def self.near lat, long
    close_stations = BikeStation.all_stations.select do |station|
      station.distance_to(lat, long) < CLOSE_RADIUS
    end
    close_stations.sort_by { |s| s.distance_to(lat, long) }
  end

  def extra_detail
    "#{@num_bikes} available, #{@num_docks} empty"
  end
end
