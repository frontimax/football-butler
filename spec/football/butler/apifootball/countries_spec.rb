# frozen_string_literal: true

RSpec.describe Football::Butler::Countries do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_APIFOOTBALL,
      api_name: :apifootball_com
    )

    stubs_area_apifootball
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_id' do
    it 'returns one country' do
      response = described_class.by_id(id: 2002)

      expect(response).to be_a(Hash)
      expect(response['message']).to eq("Method 'by_id' is not supported for the endpoint 'Countries' by this API: apifootball_com")
    end
  end

  describe 'when all' do
    it 'returns all countries' do
      response = described_class.all

      expect(response).to be_a(Array)
      expect(response).to match_array(response_areas_apifootball)
    end

    it 'returns all countries with result param :default' do
      response = described_class.all(result: :default)

      expect(response).to be_a(HTTParty::Response)
      expect(response.parsed_response).to be_a(Array)
      expect(response.parsed_response).to match_array(response_areas_apifootball)
    end
  end

  describe 'when by_name' do
    it 'returns one country by name' do
      response = described_class.by_name(name: 'Albania')

      expect(response).to be_a(Hash)
      expect(response['message']).to eq("Method 'by_name' is not supported for the endpoint 'Countries' by this API: apifootball_com")
    end

    it 'returns no country when unkown name' do
      response = described_class.by_name(name: 'Absurdistan')

      expect(response).to be_a(Hash)
      expect(response['message']).to eq("Method 'by_name' is not supported for the endpoint 'Countries' by this API: apifootball_com")
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
      expect(response['message']).to eq("Method 'by_name' is not supported for the endpoint 'Countries' by this API: apifootball_com")
    end
  end
end
