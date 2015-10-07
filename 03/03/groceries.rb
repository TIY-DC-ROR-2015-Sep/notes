require "sinatra/base"
require "pry"

class Groceries < Sinatra::Base
  set :logging, true
end

Groceries.run!
