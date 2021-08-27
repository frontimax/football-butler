# frozen_string_literal: true

RSpec.describe Football::Butler::HeadToHead do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_API_FOOTBALL,
      api_name: :api_football_com
    )

    stubs_head_to_head_api_football
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_id' do
    it 'returns one head to head' do
      response = described_class.by_teams(team_id: 20, second_team_id: 21)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_head_to_head_api_football)
    end
  end
end

def stubs_head_to_head_api_football
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/fixtures/headtohead?h2h=20-21")
    .to_return(status: 200, body: get_mocked_response('head_to_head.json', :api_football))
end

def response_head_to_head_api_football
  [
    {
      "fixture": {
        "id": 135797,
        "referee": "Antonio Mateu, Spain",
        "timezone": "UTC",
        "date": "2018-06-21T12:00:00+00:00",
        "timestamp": 1529582400,
        "periods": {
          "first": 1529582400,
          "second": 1529586000
        }.with_indifferent_access,
        "venue": {
          "id": "",
          "name": "Samara Arena",
          "city": "Samara"
        }.with_indifferent_access,
        "status": {
          "long": "Match Finished",
          "short": "FT",
          "elapsed": 90
        }.with_indifferent_access
      }.with_indifferent_access,
      "league": {
        "id": 1,
        "name": "World Cup",
        "country": "World",
        "logo": "https://media.api-sports.io/football/leagues/1.png",
        "flag": "",
        "season": 2018,
        "round": "Group Stage - 2"
      }.with_indifferent_access,
      "teams": {
        "home": {
          "id": 21,
          "name": "Denmark",
          "logo": "https://media.api-sports.io/football/teams/21.png",
          "winner": ""
        }.with_indifferent_access,
        "away": {
          "id": 20,
          "name": "Australia",
          "logo": "https://media.api-sports.io/football/teams/20.png",
          "winner": ""
        }.with_indifferent_access
      }.with_indifferent_access,
      "goals": {
        "home": 1,
        "away": 1
      }.with_indifferent_access,
      "score": {
        "halftime": {
          "home": 1,
          "away": 1
        }.with_indifferent_access,
        "fulltime": {
          "home": 1,
          "away": 1
        }.with_indifferent_access,
        "extratime": {
          "home": "",
          "away": ""
        }.with_indifferent_access,
        "penalty": {
          "home": "",
          "away": ""
        }.with_indifferent_access
      }.with_indifferent_access
    }.with_indifferent_access
  ]
end
