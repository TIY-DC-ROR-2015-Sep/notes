require "./station"

s = Station.new({
  "Lat" => 40,
  "Lon" => 50
})
puts s.distance_to 40, 50.1
