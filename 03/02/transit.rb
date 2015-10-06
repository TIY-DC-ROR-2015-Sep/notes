require "pry"
require "httparty"
require "haversine"

require "./station"

CLOSE_RADIUS = 1

puts "Where are you?"
# lat  = gets.chomp
# long = gets.chomp

lat  =  38.903192
long = -77.039766

r = HTTParty.get(
  "https://api.wmata.com/Rail.svc/json/jStations",
  headers: { "api_key" => "d311c928b8364eff80d7462f7938b2b1" }
)

stations = r["Stations"].map { |h| Station.new(h) }

close_stations = stations.select do |station|
  station.distance_to(lat, long) < CLOSE_RADIUS
end

binding.pry
