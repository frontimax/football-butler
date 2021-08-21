# frozen_string_literal: true

RSpec.describe Football::Butler::Matches do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_APIFOOTBALL,
      api_name: :apifootball_com
    )
    
    stubs_matches_apifootball
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_id' do
    it 'returns one match' do
      response = described_class.by_id(id: 205430)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_match_apifootball)
    end
  end

  describe 'when all' do
    it 'returns parameters missing' do
      response = described_class.all

      expect(response).to be_a(Hash)
      expect(response['message']).to eq('Required parameters missing')
    end

    it 'returns parameters missing with param :default' do
      response = described_class.all(result: :default)

      expect(response).to be_a(Hash)
      expect(response['message']).to eq('Required parameters missing')
    end

    it 'returns match by match_id' do
      response = described_class.all(filters: { match_id: 205430 })

      expect(response).to be_a(Array)
      expect(response).to match_array(response_match_apifootball)
    end

    it 'returns returns match by match_id result param :default' do
      response = described_class.all(result: :default)

      expect(response).to be_a(Hash)
      expect(response['message']).to eq('Required parameters missing')
    end
  end

  describe 'when by_competition' do
    it 'returns all matches of competition' do
      response = described_class.by_competition(id: 149)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_match_apifootball)
    end
  end

  describe 'when by_competition_and_year' do
    it 'returns all matches of competition and season year' do
      response = described_class.by_competition_and_year(id: 149, year: 2020)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_match_apifootball)
    end
  end

  describe 'when by_team' do
    it 'returns all matches of a team' do
      response = described_class.by_team(id: 148)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_match_apifootball)
    end
  end
end
