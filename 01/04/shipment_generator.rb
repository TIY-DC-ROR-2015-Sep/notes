require 'csv'
require 'faker'

planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"] # :(

f = File.open "./shipments.csv", "w" # w - for writing
f.puts "Destination,What got shipped,Number of crates,Profit per crate"

1000.times do
  destination = planets.sample
  item        = Faker::Commerce.product_name.gsub(",", "")
  number      = rand(10 .. 1000)
  profit      = rand(500 .. 5000)

  line = [destination, item, number.to_s, profit.to_s].join ","
  f.puts line
end
