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

    it 'returns all areas with result param :parsed_response' do
      response = described_class.all(result: :parsed_response)

      expect(response).to be_a(Hash)
      expect(response).to include(response_areas_all.stringify_keys)
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

