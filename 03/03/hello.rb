require "sinatra"

get "/" do
  "Hello, world!"
end

get "/asdf" do
  "Got GET request to /asdf"
end
