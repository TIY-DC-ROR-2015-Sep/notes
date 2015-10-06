require "pry"
require "httparty"
require "haversine"

require "./station"
require "./bike_station"

CLOSE_RADIUS = 1

# puts "Where are you?"
# lat  = gets.chomp
# long = gets.chomp

lat  =  38.903192
long = -77.039766

bikes  = BikeStation.near(lat, long)
metros = Station.near(lat, long)

all_stations = (bikes + metros).sort_by { |s| s.distance_to(lat, long) }
all_stations.each do |station|
  title = "#{station.name} (#{station.distance_to(lat, long).round(2)} mi)"
  puts title
  puts "=" * title.length

  if station.respond_to? :upcoming_trains
    station.upcoming_trains.each do |train|
      puts " #{train["Car"]}\t#{train["Min"]}\t#{train["Destination"]}"
    end
  end

  puts
end
