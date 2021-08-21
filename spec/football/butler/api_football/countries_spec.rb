# frozen_string_literal: true

RSpec.describe Football::Butler::Countries do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_API_FOOTBALL,
      api_name: :api_football_com
    )

    stubs_countries_api_dash
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_id' do
    it 'returns one country' do
      response = described_class.by_id(id: 2002)

      expect(response).to be_a(Hash)
      expect(response['message']).to eq( "Method 'by_id' is not supported for the endpoint 'Countries' by this API: api_football_com")
    end
  end

  describe 'when by_code' do
    it 'returns one country' do
      response = described_class.by_code(code: 'AL')

      expect(response).to be_a(Array)
      expect(response).to match_array(response_area_api_dash)
    end
  end

  describe 'when all' do
    it 'returns all countries' do
      response = described_class.all

      expect(response).to be_a(Array)
      expect(response).to match_array(response_areas_api_dash)
    end

    it 'returns all countries with result param :default' do
      response = described_class.all(result: :default)

      expect(response).to be_a(HTTParty::Response)
      expect(response.parsed_response).to be_a(Hash)
      expect(response.parsed_response).to include(response_areas_all_api_dash.stringify_keys)
    end
  end

  describe 'when by_name' do
    it 'returns one country by name' do
      response = described_class.by_name(name: 'Albania')

      expect(response).to be_a(Array)
      expect(response).to match_array(response_area_api_dash)
    end

    it 'returns no country when unknown name' do
      response = described_class.by_name(name: 'Absurdistan')

      expect(response).to be_a(Array)
      expect(response).to be_empty
    end
  end

  describe 'without api token' do
    before do
      Football::Butler::Configuration.reconfigure(api_token: nil)
    end

    it 'returns invalid_config_result' do
      Football::Butler::Configuration.reconfigure(api_token: '')
      response = described_class.by_name(name: 'Albania')

      expect(response).to be_a(Hash)
      expect(response['message']).to eq(Football::Butler::Base::MSG_INVALID_CONFIG)
    end
  end
end

def stubs_countries_api_dash
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/countries/2002")
    .to_return(status: 200, body: get_mocked_response('country.json', :api_football))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/countries?name=Absurdistan")
    .to_return(status: 200, body: get_mocked_response('leagues_missing_name.json', :api_football))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/countries?name=Albania")
    .to_return(status: 200, body: get_mocked_response('country.json', :api_football))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/countries?code=AL")
    .to_return(status: 200, body: get_mocked_response('country.json', :api_football))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/countries")
    .to_return(status: 200, body: get_mocked_response('countries.json', :api_football))
end

def response_area_api_dash
  [
    {
      "name": "Albania",
      "code": "AL",
      "flag": "https://media.api-sports.io/flags/al.svg"
    }.with_indifferent_access
  ]
end

def response_areas_all_api_dash
  {
    "get": "countries",
    "parameters": [],
    "errors": [],
    "results": 161,
    "paging": {
      "current": 1,
      "total": 1
    }.with_indifferent_access,
    "response": [
             {
               "id": 2000,
               "name": "Afghanistan",
               "countryCode": "AFG",
               "ensignUrl": "null",
               "parentAreaId": 2014,
               "parentArea": "Asia"
             }.with_indifferent_access,
             {
               "id": 2001,
               "name": "Africa",
               "countryCode": "AFR",
               "ensignUrl": "null",
               "parentAreaId": 2267,
               "parentArea": "World"
             }.with_indifferent_access,
             {
               "id": 2002,
               "name": "Albania",
               "countryCode": "ALB",
               "ensignUrl": "null",
               "parentAreaId": 2077,
               "parentArea": "Europe"
             }.with_indifferent_access
           ]
  }.with_indifferent_access
end

def response_areas_api_dash
  [
    {
      "id": 2000,
      "name": "Afghanistan",
      "countryCode": "AFG",
      "ensignUrl": "null",
      "parentAreaId": 2014,
      "parentArea": "Asia"
    }.with_indifferent_access,
    {
      "id": 2001,
      "name": "Africa",
      "countryCode": "AFR",
      "ensignUrl": "null",
      "parentAreaId": 2267,
      "parentArea": "World"
    }.with_indifferent_access,
    {
      "id": 2002,
      "name": "Albania",
      "countryCode": "ALB",
      "ensignUrl": "null",
      "parentAreaId": 2077,
      "parentArea": "Europe"
    }.with_indifferent_access
  ]
end
