require "httparty"
require "pry"

Token = File.read("./secret.txt").strip

# response = HTTParty.get "https://api.github.com/repos/rails/rails/contributors"
# response.each_with_index do |contributor, i|
#   puts "#{i}) #{contributor["login"]}"
# end
#
# puts "Which number?"
# number = gets.chomp.to_i
#
# contributor_name = response[number]["login"]
#
#
# response = HTTParty.get "https://api.github.com/users/#{contributor_name}"
# puts "#{response["name"]} works for #{response["company"]} in #{response["location"]}"

HTTParty.post "https://slack.com/api/chat.postMessage", body: {
  channel: "#dc_sept2015_rails",
  text: "Hello from apis.rb",
  token: Token
}
# binding.pry
