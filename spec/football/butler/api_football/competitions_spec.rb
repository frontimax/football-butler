# frozen_string_literal: true

RSpec.describe Football::Butler::Competitions do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_API_FOOTBALL,
      api_name: :api_football_com
    )

    stubs_leagues_api_dash
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_country_name' do
    it 'returns leagues' do
      response = described_class.by_country_name(name: 'Germany')

      expect(response).to be_a(Array)
      expect(response).to match(response_league_api_dash)
    end
  end

  describe 'when by_id' do
    it 'returns league' do
      response = described_class.by_id(id: 78)

      expect(response).to be_a(HTTParty::Response)
      expect(response.parsed_response).to be_a(Hash)
      expect(response.parsed_response).to include(response_league_by_id_api_dash.stringify_keys)
    end

    it 'returns league' do
      response = Football::Butler::Competitions.by_id(id: 78)

      expect(response).to be_a(HTTParty::Response)
      expect(response.parsed_response).to be_a(Hash)
      expect(response.parsed_response).to include(response_league_by_id_api_dash.stringify_keys)
    end
  end

  describe 'when all_seasons' do
    it 'returns leagues' do
      response = described_class.all_seasons

      expect(response).to be_a(Array)
      expect(response).to match(response_league_seasons_api_dash)
    end
  end

  describe 'when all' do
    it 'returns all leagues' do
      response = described_class.all

      expect(response).to be_a(Array)
      expect(response).to match(response_league_api_dash)
    end
  end

  describe 'when all with result parsed_response' do
    it 'returns all leagues' do
      response = described_class.all(result: :parsed_response)

      expect(response).to be_a(Hash)
      expect(response['response']).to be_a(Array)
      expect(response['response']).to match(response_league_api_dash)
    end
  end

  describe 'when all with result data' do
    it 'returns all leagues' do
      response = described_class.all(result: :data)

      expect(response).to be_a(Array)
      expect(response).to match(response_league_api_dash)
    end
  end

  describe 'when all with result response' do
    it 'returns all leagues' do
      response = described_class.all(result: :response)

      expect(response).to be_a(Array)
      expect(response).to match(response_league_api_dash)
    end
  end
end
