class Station
  include Locatable
  extend Locatable::ClassMethods

  attr_reader :name

  def initialize data_hash
    @name = data_hash["Name"]
    @lat  = data_hash["Lat"].to_f
    @long = data_hash["Lon"].to_f
    @code = data_hash["Code"]
  end

  def upcoming_trains
    r = HTTParty.get(
      "https://api.wmata.com/StationPrediction.svc/json/GetPrediction/#{@code}",
      headers: { "api_key" => "d311c928b8364eff80d7462f7938b2b1" }
    )
    r["Trains"]
  end

  def self.all_stations
    r = HTTParty.get(
      "https://api.wmata.com/Rail.svc/json/jStations",
      headers: { "api_key" => "d311c928b8364eff80d7462f7938b2b1" }
    )
    r["Stations"].map { |h| Station.new(h) }
  end

  def extra_detail
    upcoming_trains.map do |train|
      " #{train["Car"]}\t#{train["Min"]}\t#{train["Destination"]}"
    end
  end
end
