require "sinatra/base"
require "pry"

class BetterServer < Sinatra::Base
  set :port, 8080
  set :logging, true

  get "/" do
    "Got GET request to / for BetterServer"
  end

  post "/zxcv" do
    "That was a post"
  end

  get "/zxcv" do
    "That was a get"
  end

  get "/echo/:phrase" do
    if params[:reverse]
      params[:phrase].reverse
    else
      params[:phrase]
    end
  end
end

BetterServer.run!
