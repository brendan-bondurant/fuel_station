class SearchFacade
attr_reader :location, :closest

  def initialize(location)
    @location = location 

  end

  def closest
    service = SearchService.new
    json = service.closest_charger(location)
    Location.new(json[:fuel_stations].first)
  end

  def directions
    service = DirectionService.new
    dest = closest.address
    json = service.directions(location, dest)
    Directions.new(json[:route])
  end
end

# json[:route][:legs].first[:maneuvers].first[:narrative]