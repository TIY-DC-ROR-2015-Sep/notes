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

stations = []
r["Stations"].each do |h|
  stations.push Station.new(h)
end

close_stations = []
stations.each do |station|
  d = Haversine.distance(lat, long, station.lat, station.long)
  if d.to_miles < CLOSE_RADIUS
    close_stations.push station
  end
end

binding.pry
