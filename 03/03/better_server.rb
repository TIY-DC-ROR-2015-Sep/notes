require "sinatra/base"
require "pry"

class Dice
  def self.big_roll num_of_dice, num_of_sides
    d = Dice.new num_of_sides

    sum = 0
    num_of_dice.times { sum += d.roll }
    sum
  end

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

    Dice.big_roll(num, max).to_s
  end
end

BetterServer.run!
