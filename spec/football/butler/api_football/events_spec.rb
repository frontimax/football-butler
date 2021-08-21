# frozen_string_literal: true

RSpec.describe Football::Butler::Events do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_API_FOOTBALL,
      api_name: :api_football_com,
      wait_on_limit: true
    )

    stubs_fixtures_api_football
  end

  describe 'when by_id' do
    it 'returns one fixture' do
      response = described_class.by_id(id: 587177)

      expect(response).to be_a(HTTParty::Response)
      expect(response.parsed_response).to be_a(Hash)
      expect(response.parsed_response['response']).to be_a(Array)
      expect(response.parsed_response['response']).to match_array(response_fixture_api_football)
    end

    it 'returns one fixture' do
      response = Football::Butler::Events.by_id(id: 587177)

      expect(response).to be_a(HTTParty::Response)
      expect(response.parsed_response).to be_a(Hash)
      expect(response.parsed_response['response']).to be_a(Array)
      expect(response.parsed_response['response']).to match_array(response_fixture_api_football)
    end
  end

  describe 'when by_competition_and_year' do
    it 'returns all fixtures of competition and season year' do
      response = described_class.by_competition_and_year(id: 587177, year: 2020)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_fixtures_more_api_football)
    end
  end
end
