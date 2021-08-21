# frozen_string_literal: true

RSpec.describe Football::Butler::Scorers do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_API_FOOTBALL,
      api_name: :api_football_com
    )

    stubs_scorers_api_dash
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_competition_and_year' do
    context 'success' do
      it 'returns scorers' do
        response = described_class.by_competition_and_year(id: 78, year: 2020)

        expect(response).to be_a(Array)
        expect(response).to match_array(response_scorers_api_dash)
      end
    end

    context 'error' do
      it 'returns scorers' do
        response = described_class.by_competition_and_year(id: 78, year: 2000)

        expect(response).to be_a(Array)
        expect(response).to be_empty
      end
    end
  end
end
