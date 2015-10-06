require "pry"
require "httparty"

require "./station"

puts "Where are you?"
# lat  = gets.chomp
# long = gets.chomp

lat  = 39
long = -77

r = HTTParty.get(
  "https://api.wmata.com/Rail.svc/json/jStations",
  headers: { "api_key" => "d311c928b8364eff80d7462f7938b2b1" }
)

stations = []
r["Stations"].each do |h|
  stations.push Station.new(h)
end

binding.pry
