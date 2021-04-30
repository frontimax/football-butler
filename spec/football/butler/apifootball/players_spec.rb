# frozen_string_literal: true

RSpec.describe Football::Butler::Players do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_APIFOOTBALL,
      api_name: :apifootball_com
    )

    stubs_player_apifootball
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_id' do
    it 'returns one player' do
      response = described_class.by_id(id: 4068429598)

      expect(response.parsed_response).to be_a(Array)
      expect(response.parsed_response).to match_array(response_player_apifootball)
    end
  end

  describe 'when by_name' do
    it 'returns one player' do
      response = described_class.by_name(name: 'Salaheddine')

      expect(response.parsed_response).to be_a(Array)
      expect(response.parsed_response).to match_array(response_player_apifootball)
    end
  end
end

def stubs_player_apifootball
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}APIkey=my_dummy_token&action=get_players&player_id=4068429598")
    .to_return(status: 200, body: get_mocked_response('player.json', :apifootball))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}APIkey=my_dummy_token&action=get_players&player_name=Salaheddine")
    .to_return(status: 200, body: get_mocked_response('player.json', :apifootball))
end

def response_player_apifootball
  [
    {
      "player_key": 4068429598,
      "player_name": "El Mhamdi Salaheddine",
      "player_number": "",
      "player_country": "Netherlands",
      "player_type": "Forwards",
      "player_age": "24",
      "player_match_played": "0",
      "player_goals": "0",
      "player_yellow_cards": "0",
      "player_red_cards": "0",
      "team_name": "Westlandia",
      "team_key": "5141"
    }.with_indifferent_access
  ]
end
