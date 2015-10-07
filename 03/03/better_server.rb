require "sinatra/base"
require "pry"

class BetterServer < Sinatra::Base
  set :port, 8080
  set :logging, true

  get "/" do
    "Got GET request to / for BetterServer"
  end
end

binding.pry
BetterServer.run!
