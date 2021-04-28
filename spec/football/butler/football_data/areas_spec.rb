# frozen_string_literal: true

RSpec.describe Football::Butler::Areas do
  before do
    stubs_area
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_id' do
    it 'returns one area' do
      response = described_class.by_id(id: 2002)

      expect(response.parsed_response).to be_a(Hash)
      expect(response.parsed_response).to include(response_area.stringify_keys)
    end
  end

  describe 'when all' do
    it 'returns all areas' do
      response = described_class.all

      expect(response).to be_a(Array)
      expect(response).to match_array(response_areas)
    end

    it 'returns all areas with result param :default' do
      response = described_class.all(result: :default)

      expect(response).to be_a(HTTParty::Response)
      expect(response.parsed_response).to be_a(Hash)
      expect(response.parsed_response).to include(response_areas_all.stringify_keys)
    end
  end

  describe 'when by_name' do
    it 'returns one area by name' do
      response = described_class.by_name(name: 'Albania')

      expect(response).to be_a(HTTParty::Response)
      expect(response.parsed_response).to be_a(Hash)
      expect(response.parsed_response).to include(response_area.stringify_keys)
    end

    it 'returns no area when unkown name' do
      response = described_class.by_name(name: 'Absurdistan')

      expect(response).to be_a(Hash)
      expect(response['message']).to eq('Absurdistan could not be found.')
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

def stubs_area
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/areas/2002")
    .to_return(status: 200, body: get_mocked_response('area.json', :football_data))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/areas")
    .to_return(status: 200, body: get_mocked_response('areas.json', :football_data))
end

def response_area
  {
    "id": 2002,
    "name": "Albania",
    "countryCode": "ALB",
    "ensignUrl": 'null',
    "parentAreaId": 2077,
    "parentArea": "Europe"
  }
end

def response_areas_all
  {
    "count": 3,
    "filters": {},
    "areas": [
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
  }
end

def response_areas
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
