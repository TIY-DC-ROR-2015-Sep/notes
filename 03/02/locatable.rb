module Locatable
  attr_reader :lat, :long

  def distance_to other_lat, other_long
    Haversine.distance(@lat, @long, other_lat, other_long).to_miles
  end
end
