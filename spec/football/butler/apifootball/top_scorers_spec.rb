# frozen_string_literal: true

RSpec.describe Football::Butler::TopScorers do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_APIFOOTBALL,
      api_name: :apifootball_com
    )

    stubs_top_scorers_apifootball
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_id' do
    it 'returns top_scorers' do
      response = described_class.by_competition(id: 302)

      expect(response).to be_a(Array)
      expect(response).to match(response_top_scorers_apifootball)
    end
  end
end

def stubs_top_scorers_apifootball
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}APIkey=my_dummy_token&action=get_topscorers&league_id=302")
    .to_return(status: 200, body: get_mocked_response('top_scorers.json', :apifootball))
end

def response_top_scorers_apifootball
  [
    {
      "player_place": "1",
      "player_name": "L. Messi",
      "player_key": 1135663375,
      "team_name": "Barcelona",
      "team_key": "97",
      "goals": "30",
      "assists": "9",
      "penalty_goals": "3"
    }.with_indifferent_access,
    {
      "player_place": "2",
      "player_name": "Gerard Moreno",
      "player_key": 387294631,
      "team_name": "Villarreal",
      "team_key": "162",
      "goals": "23",
      "assists": "",
      "penalty_goals": "10"
    }.with_indifferent_access
  ]
end
