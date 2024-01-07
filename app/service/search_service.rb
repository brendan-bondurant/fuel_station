require 'faraday'

class SearchService
  def conn
    Faraday.new(url: 'https://developer.nrel.gov/') do |faraday|
      faraday.params['api_key'] = Rails.application.credentials.nrel[:key]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def closest_charger(location)
    get_url("/api/alt-fuel-stations/v1/nearest?format=json&location=#{location}&limit=1")
  end
end