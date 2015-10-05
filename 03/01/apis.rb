require "httparty"
require "pry"

response = HTTParty.get "https://api.github.com/repos/rails/rails/contributors"
response.each_with_index do |contributor, i|
  puts "#{i}) #{contributor["login"]}"
end

puts "Which number?"
number = gets.chomp.to_i

contributor_name = response[number]["login"]


response = HTTParty.get "https://api.github.com/users/#{contributor_name}"
puts "#{response["name"]} works for #{response["company"]} in #{response["location"]}"

# binding.pry
