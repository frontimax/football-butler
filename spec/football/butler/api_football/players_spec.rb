# frozen_string_literal: true

RSpec.describe Football::Butler::Players do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_API_FOOTBALL,
      api_name: :api_football_com
    )

    stubs_player_api_football
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_id_and_season' do
    context 'success' do
      it 'returns players' do
        response = described_class.by_id_and_season(id: 7190, season: 2020)

        expect(response).to be_a(Array)
        expect(response).to match_array(response_players_api_football)
      end
    end
  end
end

def stubs_player_api_football
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/players?id=7190&season=2020")
    .to_return(status: 200, body: get_mocked_response('players.json', :api_football))
end

def response_players_api_football
  [
    {
      "player": {
        "id": 7190,
        "name": "Alan Lima Cariús",
        "firstname": "Alan",
        "lastname": "Lima Cariús",
        "age": 24,
        "birth": {
          "date": "1997-04-04",
          "place": "Petrópolis",
          "country": "Brazil"
        }.with_indifferent_access,
        "nationality": "Brazil",
        "height": "175 cm",
        "weight": "74 kg",
        "injured": false,
        "photo": "https://media.api-sports.io/football/players/7190.png"
      }.with_indifferent_access,
      "statistics": [
                  {
                    "team": {
                      "id": 3609,
                      "name": "Tuzlaspor",
                      "logo": "https://media.api-sports.io/football/teams/3609.png"
                    }.with_indifferent_access,
                    "league": {
                      "id": 204,
                      "name": "TFF 1. Lig",
                      "country": "Turkey",
                      "logo": "https://media.api-sports.io/football/leagues/204.png",
                      "flag": "https://media.api-sports.io/flags/tr.svg",
                      "season": 2020
                    }.with_indifferent_access,
                    "games": {
                      "appearences": 6,
                      "lineups": 3,
                      "minutes": 228,
                      "number": "",
                      "position": "Midfielder",
                      "rating": "7.280000",
                      "captain": false
                    }.with_indifferent_access,
                    "substitutes": {
                      "in": 3,
                      "out": 3,
                      "bench": 3
                    }.with_indifferent_access,
                    "shots": {
                      "total": 5,
                      "on": 3
                    }.with_indifferent_access,
                    "goals": {
                      "total": 2,
                      "conceded": 0,
                      "assists": "",
                      "saves": ""
                    }.with_indifferent_access,
                    "passes": {
                      "total": 91,
                      "key": 7,
                      "accuracy": 13
                    }.with_indifferent_access,
                    "tackles": {
                      "total": 10,
                      "blocks": "",
                      "interceptions": 1
                    }.with_indifferent_access,
                    "duels": {
                      "total": 34,
                      "won": 18
                    }.with_indifferent_access,
                    "dribbles": {
                      "attempts": 2,
                      "success": 2,
                      "past": ""
                    }.with_indifferent_access,
                    "fouls": {
                      "drawn": 4,
                      "committed": 7
                    }.with_indifferent_access,
                    "cards": {
                      "yellow": 0,
                      "yellowred": 0,
                      "red": 0
                    }.with_indifferent_access,
                    "penalty": {
                      "won": "",
                      "commited": "",
                      "scored": 0,
                      "missed": 0,
                      "saved": ""
                    }.with_indifferent_access
                  }.with_indifferent_access,
                  {
                    "team": {
                      "id": 1004,
                      "name": "Kasimpasa",
                      "logo": "https://media.api-sports.io/football/teams/1004.png"
                    }.with_indifferent_access,
                    "league": {
                      "id": 203,
                      "name": "Super Lig",
                      "country": "Turkey",
                      "logo": "https://media.api-sports.io/football/leagues/203.png",
                      "flag": "https://media.api-sports.io/flags/tr.svg",
                      "season": 2020
                    }.with_indifferent_access,
                    "games": {
                      "appearences": 15,
                      "lineups": 8,
                      "minutes": 688,
                      "number": "",
                      "position": "Midfielder",
                      "rating": "6.514285",
                      "captain": false
                    }.with_indifferent_access,
                    "substitutes": {
                      "in": 7,
                      "out": 4,
                      "bench": 9
                    }.with_indifferent_access,
                    "shots": {
                      "total": 11,
                      "on": 5
                    }.with_indifferent_access,
                    "goals": {
                      "total": 1,
                      "conceded": 0,
                      "assists": 1,
                      "saves": ""
                    }.with_indifferent_access,
                    "passes": {
                      "total": 184,
                      "key": 13,
                      "accuracy": 8
                    }.with_indifferent_access,
                    "tackles": {
                      "total": 9,
                      "blocks": "",
                      "interceptions": 3
                    }.with_indifferent_access,
                    "duels": {
                      "total": 84,
                      "won": 23
                    }.with_indifferent_access,
                    "dribbles": {
                      "attempts": 7,
                      "success": 3,
                      "past": ""
                    }.with_indifferent_access,
                    "fouls": {
                      "drawn": 8,
                      "committed": 19
                    }.with_indifferent_access,
                    "cards": {
                      "yellow": 1,
                      "yellowred": 0,
                      "red": 0
                    }.with_indifferent_access,
                    "penalty": {
                      "won": "",
                      "commited": "",
                      "scored": 0,
                      "missed": 0,
                      "saved": ""
                    }.with_indifferent_access
                  }.with_indifferent_access,
                  {
                    "team": {
                      "id": 1004,
                      "name": "Kasimpasa",
                      "logo": "https://media.api-sports.io/football/teams/1004.png"
                    }.with_indifferent_access,
                    "league": {
                      "id": 206,
                      "name": "Cup",
                      "country": "Turkey",
                      "logo": "https://media.api-sports.io/football/leagues/206.png",
                      "flag": "https://media.api-sports.io/flags/tr.svg",
                      "season": 2020
                    }.with_indifferent_access,
                    "games": {
                      "appearences": 3,
                      "lineups": 2,
                      "minutes": 170,
                      "number": "",
                      "position": "Midfielder",
                      "rating": "",
                      "captain": false
                    }.with_indifferent_access,
                    "substitutes": {
                      "in": 1,
                      "out": 2,
                      "bench": 1
                    }.with_indifferent_access,
                    "shots": {
                      "total": "",
                      "on": ""
                    }.with_indifferent_access,
                    "goals": {
                      "total": 2,
                      "conceded": "",
                      "assists": "",
                      "saves": ""
                    }.with_indifferent_access,
                    "passes": {
                      "total": "",
                      "key": "",
                      "accuracy": ""
                    }.with_indifferent_access,
                    "tackles": {
                      "total": "",
                      "blocks": "",
                      "interceptions": ""
                    }.with_indifferent_access,
                    "duels": {
                      "total": "",
                      "won": ""
                    }.with_indifferent_access,
                    "dribbles": {
                      "attempts": "",
                      "success": "",
                      "past": ""
                    }.with_indifferent_access,
                    "fouls": {
                      "drawn": "",
                      "committed": ""
                    }.with_indifferent_access,
                    "cards": {
                      "yellow": 0,
                      "yellowred": 0,
                      "red": 0
                    }.with_indifferent_access,
                    "penalty": {
                      "won": "",
                      "commited": "",
                      "scored": "",
                      "missed": "",
                      "saved": ""
                    }.with_indifferent_access
                  }.with_indifferent_access,
                  {
                    "team": {
                      "id": 1027,
                      "name": "SKN ST. Polten",
                      "logo": "https://media.api-sports.io/football/teams/1027.png"
                    }.with_indifferent_access,
                    "league": {
                      "id": 220,
                      "name": "Cup",
                      "country": "Austria",
                      "logo": "https://media.api-sports.io/football/leagues/220.png",
                      "flag": "https://media.api-sports.io/flags/at.svg",
                      "season": 2020
                    }.with_indifferent_access,
                    "games": {
                      "appearences": 1,
                      "lineups": 0,
                      "minutes": 23,
                      "number": "",
                      "position": "Midfielder",
                      "rating": "",
                      "captain": false
                    }.with_indifferent_access,
                    "substitutes": {
                      "in": 1,
                      "out": 0,
                      "bench": 1
                    }.with_indifferent_access,
                    "shots": {
                      "total": "",
                      "on": ""
                    }.with_indifferent_access,
                    "goals": {
                      "total": 0,
                      "conceded": "",
                      "assists": "",
                      "saves": ""
                    }.with_indifferent_access,
                    "passes": {
                      "total": "",
                      "key": "",
                      "accuracy": ""
                    }.with_indifferent_access,
                    "tackles": {
                      "total": "",
                      "blocks": "",
                      "interceptions": ""
                    }.with_indifferent_access,
                    "duels": {
                      "total": "",
                      "won": ""
                    }.with_indifferent_access,
                    "dribbles": {
                      "attempts": "",
                      "success": "",
                      "past": ""
                    }.with_indifferent_access,
                    "fouls": {
                      "drawn": "",
                      "committed": ""
                    }.with_indifferent_access,
                    "cards": {
                      "yellow": 0,
                      "yellowred": 0,
                      "red": 0
                    }.with_indifferent_access,
                    "penalty": {
                      "won": "",
                      "commited": "",
                      "scored": "",
                      "missed": "",
                      "saved": ""
                    }.with_indifferent_access
                  }.with_indifferent_access
                ]
    }.with_indifferent_access
  ]
end
