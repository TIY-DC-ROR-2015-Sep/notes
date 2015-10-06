class Station
  attr_reader :lat, :long

  def initialize data_hash
    @name = data_hash["Name"]
    @lat  = data_hash["Lat"]
    @long = data_hash["Lon"]
  end

  def upcoming_trains
  end
end
