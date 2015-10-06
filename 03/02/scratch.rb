require 'httparty'
require 'pry'

r = HTTParty.get(
  "https://api.wmata.com/Rail.svc/json/jStations",
  headers: { "api_key" => "d311c928b8364eff80d7462f7938b2b1" }
)

s = r["Stations"][1]
puts "#{s['Name']} is at #{s['Lat']},#{s['Lon']}"
code = s["Code"]

r2 = HTTParty.get(
  "https://api.wmata.com/StationPrediction.svc/json/GetPrediction/#{code}",
  headers: { "api_key" => "d311c928b8364eff80d7462f7938b2b1" }
)
last_train = r2["Trains"].last
puts "Last train leaves in #{last_train["Min"]}"

binding.pry
