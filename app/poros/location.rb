class Location
attr_reader :name, :address, :fuel_type, :access_times
  def initialize(info)
    @name = info[:station_name]
    @street_address = info[:street_address]
    @state = info[:state]
    @zip = info[:zip]
    @city = info[:city]
    @fuel_type = info[:fuel_type_code]
    @access_times = info[:access_days_time]
  end

  def address
    @street_address + ", " + @city + ", " + @state + " " + @zip
  end
end