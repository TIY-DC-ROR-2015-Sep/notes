require "sinatra/base"
require "pry"

class Dice
  def initialize sides
    @sides = sides.to_i
  end

  def roll
    rand 1 .. @sides
  end
end

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

  delete "/roll" do
    num = request.env["HTTP_X_NUM_DICE"] || 1
    max = params[:sides] || 6

    sum = 0
    num.to_i.times do
      sum += rand(1 .. max.to_i)
    end
    sum.to_s
  end
end

BetterServer.run!
