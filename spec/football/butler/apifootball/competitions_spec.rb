# frozen_string_literal: true

RSpec.describe Football::Butler::Competitions do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_APIFOOTBALL,
      api_name: :apifootball_com
    )
    
    stubs_competitions_apifootball
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_id' do
    it 'returns one competition' do
      response = described_class.by_id(id: 2002)

      expect(response).to be_a(HTTParty::Response)
      expect(response.parsed_response).to be_a(Array)

      expect(response.parsed_response).to match_array(response_competition_apifootball)
    end
  end

  describe 'when all' do
    it 'returns all competitions' do
      response = described_class.all

      expect(response).to be_a(Hash)
      expect(response['message']).to eq('This method is not supported by this API: apifootball_com')
    end

    it 'returns all competitions with result param :default' do
      response = described_class.all(result: :default)

      expect(response).to be_a(Hash)
      expect(response['message']).to eq('This method is not supported by this API: apifootball_com')
    end
  end

  describe 'when by_plan' do
    it 'returns all competitions TIER_ONE' do
      response = described_class.by_plan(plan: 'TIER_ONE')

      expect(response).to be_a(Hash)
      expect(response['message']).to eq('This method is not supported by this API: apifootball_com')
    end
  end

  describe 'when by_areas' do
    it 'returns all competitions two areas' do
      response = described_class.by_areas(ids: [2088, 2081])

      expect(response).to be_a(Hash)
      expect(response['message']).to eq('This method is not supported by this API: apifootball_com')
    end
  end

  describe 'when current_match_day' do
    it 'returns current matchday of bundesliga' do
      response = described_class.current_match_day(id: 2002)

      expect(response).to be_a(Hash)
      expect(response['message']).to eq('This method is not supported by this API: apifootball_com')
    end

    it 'returns nothing' do
      response = described_class.current_match_day(id: 9999)

      expect(response).to be_a(Hash)
      expect(response['message']).to eq('This method is not supported by this API: apifootball_com')
    end
  end

  describe 'when seasons' do
    it 'returns all seasons of bundesliga' do
      response = described_class.seasons(id: 2001)

      expect(response).to be_a(Hash)
      expect(response['message']).to eq('This method is not supported by this API: apifootball_com')
    end

    it 'returns nothing' do
      response = described_class.seasons(id: 9999)

      expect(response).to be_a(Hash)
      expect(response['message']).to eq('This method is not supported by this API: apifootball_com')
    end
  end

  describe 'when all_tier_plan_filter' do
    it 'returns all competitions with configured tier plan filter empty' do
      response = described_class.all_tier_plan_filter

      expect(response).to be_a(Hash)
      expect(response['message']).to eq('This method is not supported by this API: apifootball_com')
    end

    it 'returns all competitions with configured tier plan filter TIER_ONE' do
      Football::Butler::Configuration.reconfigure(
        tier_plan: ['TIER_ONE']
      )
      response = described_class.all_tier_plan_filter

      expect(response).to be_a(Hash)
      expect(response['message']).to eq('This method is not supported by this API: apifootball_com')
    end
  end
end

def stubs_competitions_apifootball
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}APIkey=my_dummy_token&action=get_leagues&country_id=2002")
    .to_return(status: 200, body: get_mocked_response('competition.json', :apifootball))
end

def response_missing
  {
    message: 'The resource you are looking for does not exist.'
  }.with_indifferent_access
end

def response_competition_apifootball
  [
    {
      "country_id": "41",
      "country_name": "England",
      "league_id": "149",
      "league_name": "Championship",
      "league_season": "2020/2021",
      "league_logo": "https://apiv2.apifootball.com/badges/logo_leagues/149_championship.png",
      "country_logo": "https://apiv2.apifootball.com/badges/logo_country/41_england.png"
    }.with_indifferent_access
  ]
end

