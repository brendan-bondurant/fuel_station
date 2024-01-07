class Directions 
  attr_reader :time, :distance, :directions
  def initialize(info)
    @info = info
    @time = info[:formattedTime]
    @distance = info[:distance]
    @directions = directions
  end

  def directions
    the_way = []
    routes = @info[:legs].first[:maneuvers]
    routes.each do |directions|
      the_way << directions[:narrative]
    end
    the_way
  end
end