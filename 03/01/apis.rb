require "httparty"
require "json"
require "pry"

keys = JSON.parse(File.read "./secret.txt")

response = HTTParty.get "https://api.github.com/repos/rails/rails/contributors", headers: {
  "Authorization" => "token #{keys["github"]}",
  "User-Agent" => "microsoft wandows"
}
response.each_with_index do |contributor, i|
  puts "#{i}) #{contributor["login"]}"
end

puts "Which number?"
number = gets.chomp.to_i

contributor_name = response[number]["login"]


response = HTTParty.get "https://api.github.com/users/#{contributor_name}", headers: {
  "Authorization" => "token #{keys["github"]}",
  "User-Agent" => "microsoft wandows"
}

status = "#{response["name"]} works for #{response["company"]} in #{response["location"]}"

HTTParty.post "https://slack.com/api/chat.postMessage", body: {
  channel: "#dc_sept2015_rails",
  text: status,
  token: keys["slack"]
}
# binding.pry
