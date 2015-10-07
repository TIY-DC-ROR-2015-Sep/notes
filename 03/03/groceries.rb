require "sinatra/base"
require "json"
require "pry"

List = ["apples", "bananas", "carrots"]

class Groceries < Sinatra::Base
  set :bind, "0.0.0.0"
  set :logging, true

  get "/groceries" do
    List.to_json
  end

  post "/groceries" do
    name = params[:name]

    if name.nil?
      status 400
      body "You must provide a `name`"
    elsif List.include? name
      status 422
      body "`#{name}` is already on the list"
    else
      List.push name
      "OK, added '#{name}'"
    end
  end
end

Groceries.run!
