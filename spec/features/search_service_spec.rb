require 'rails_helper'
# require 'faraday'

RSpec.describe SearchService do
  describe '#conn' do
    it 'returns a Faraday connection object' do
      test_service = SearchService.new
      connection = test_service.conn

      expect(connection).to be_a(Faraday::Connection)
      expect(connection.url_prefix.to_s).to eq('https://developer.nrel.gov/')
    end
  end
  describe '#get_url' do
    it 'returns parsed JSON response' do
      test_service = SearchService.new
      location = "test"
      allow(test_service).to receive(:conn).and_return(Faraday.new(url: 'https://developer.nrel.gov/'))
      url = "/api/alt-fuel-stations/v1/nearest?format=json&location=#{location}&fuel_type=ELEC&limit=1"
      response_body = { key: 'value' }.to_json
      response = double('response', body: response_body)
      allow(test_service.conn).to receive(:get).with(url).and_return(response)

      parsed_response = test_service.get_url(url)

      expect(parsed_response).to eq({ key: 'value' })
    end
  end

  describe '#closest_charger' do
    it 'returns nearest charger information' do
      test_service = SearchService.new
      location = "test"
      allow(test_service).to receive(:get_url).and_return({ charger: 'info' })
      nearest_charger = test_service.closest_charger(location)
      expect(nearest_charger).to eq({ charger: 'info' })
    end
  end
end