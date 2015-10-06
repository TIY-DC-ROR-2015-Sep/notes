require "pry"
require "httparty"
require "haversine"

require "./station"

CLOSE_RADIUS = 1

# puts "Where are you?"
# lat  = gets.chomp
# long = gets.chomp

lat  =  38.903192
long = -77.039766


Station.near(lat, long).each do |station|
  title = "#{station.name} (#{station.distance_to(lat, long).round(2)} mi)"
  puts title
  puts "=" * title.length
  station.upcoming_trains.each do |train|
    puts " #{train["Car"]}\t#{train["Min"]}\t#{train["Destination"]}"
  end
  puts
end
