require 'sinatra/base'
require 'pry'

class Demo < Sinatra::Base
  set :port, 5678
  
  get "/" do

    erb :search, locals: { results: nil }
  end

  post "/scramble" do
    word = params[:longitude]

    possibilities = word.chars.permutation.map { |c| c.join("") }.uniq

    erb :search, locals: { results: possibilities }
  end
end

Demo.run!
