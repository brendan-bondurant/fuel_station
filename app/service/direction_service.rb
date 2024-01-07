require 'faraday'

class DirectionService
  def conn
    Faraday.new(url: 'https://www.mapquestapi.com')

    
  end

  def key
    Rails.application.credentials.mapquest[:key]
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def directions(start, dest)
    get_url("/directions/v2/route?key=#{key}&from=#{start}&to=#{dest}")
  end
end