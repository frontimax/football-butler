# frozen_string_literal: true

RSpec.describe Football::Butler::Standings do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_API_FOOTBALL,
      api_name: :api_football_com
    )

    stubs_standing_api_football
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_competition_and_year' do
    it 'returns standings of competition by season year' do
      response = described_class.by_competition_and_year(id: 2002, year: '2020', filters: {})

      expect(response).to be_a(HTTParty::Response)
      expect(response.parsed_response).to be_a(Hash)
      expect(response.parsed_response['response']).to be_a(Array)

      expect(response.parsed_response['response']).to match_array(response_standings_api_football)
    end
  end
end

def stubs_standing_api_football
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/standings?league=2002&season=2020")
    .to_return(status: 200, body: get_mocked_response('standings.json', :api_football))
end

def response_standings_api_football
  [
    {
      "league": {
        "id": 78,
        "name": "Bundesliga 1",
        "country": "Germany",
        "logo": "https://media.api-sports.io/football/leagues/78.png",
        "flag": "https://media.api-sports.io/flags/de.svg",
        "season": 2020,
        "standings": [
                [
                  {
                    "rank": 1,
                    "team": {
                      "id": 157,
                      "name": "Bayern Munich",
                      "logo": "https://media.api-sports.io/football/teams/157.png"
                    }.with_indifferent_access,
                    "points": 78,
                    "goalsDiff": 55,
                    "group": "Bundesliga",
                    "form": "WDWLW",
                    "status": "same",
                    "description": "Promotion - Champions League (Group Stage)",
                    "all": {
                      "played": 34,
                      "win": 24,
                      "draw": 6,
                      "lose": 4,
                      "goals": {
                        "for": 99,
                        "against": 44
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "home": {
                      "played": 17,
                      "win": 13,
                      "draw": 4,
                      "lose": 0,
                      "goals": {
                        "for": 64,
                        "against": 21
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "away": {
                      "played": 17,
                      "win": 11,
                      "draw": 2,
                      "lose": 4,
                      "goals": {
                        "for": 35,
                        "against": 23
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "update": "2021-05-26T00:00:00+00:00"
                  }.with_indifferent_access,
                  {
                    "rank": 2,
                    "team": {
                      "id": 173,
                      "name": "RB Leipzig",
                      "logo": "https://media.api-sports.io/football/teams/173.png"
                    }.with_indifferent_access,
                    "points": 65,
                    "goalsDiff": 28,
                    "group": "Bundesliga",
                    "form": "LDLWL",
                    "status": "same",
                    "description": "Promotion - Champions League (Group Stage)",
                    "all": {
                      "played": 34,
                      "win": 19,
                      "draw": 8,
                      "lose": 7,
                      "goals": {
                        "for": 60,
                        "against": 32
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "home": {
                      "played": 17,
                      "win": 11,
                      "draw": 4,
                      "lose": 2,
                      "goals": {
                        "for": 29,
                        "against": 13
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "away": {
                      "played": 17,
                      "win": 8,
                      "draw": 4,
                      "lose": 5,
                      "goals": {
                        "for": 31,
                        "against": 19
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "update": "2021-05-26T00:00:00+00:00"
                  }.with_indifferent_access,
                  {
                    "rank": 3,
                    "team": {
                      "id": 165,
                      "name": "Borussia Dortmund",
                      "logo": "https://media.api-sports.io/football/teams/165.png"
                    }.with_indifferent_access,
                    "points": 64,
                    "goalsDiff": 29,
                    "group": "Bundesliga",
                    "form": "WWWWW",
                    "status": "same",
                    "description": "Promotion - Champions League (Group Stage)",
                    "all": {
                      "played": 34,
                      "win": 20,
                      "draw": 4,
                      "lose": 10,
                      "goals": {
                        "for": 75,
                        "against": 46
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "home": {
                      "played": 17,
                      "win": 11,
                      "draw": 2,
                      "lose": 4,
                      "goals": {
                        "for": 40,
                        "against": 20
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "away": {
                      "played": 17,
                      "win": 9,
                      "draw": 2,
                      "lose": 6,
                      "goals": {
                        "for": 35,
                        "against": 26
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "update": "2021-05-26T00:00:00+00:00"
                  }.with_indifferent_access,
                  {
                    "rank": 4,
                    "team": {
                      "id": 161,
                      "name": "VfL Wolfsburg",
                      "logo": "https://media.api-sports.io/football/teams/161.png"
                    }.with_indifferent_access,
                    "points": 61,
                    "goalsDiff": 24,
                    "group": "Bundesliga",
                    "form": "LDWLW",
                    "status": "same",
                    "description": "Promotion - Champions League (Group Stage)",
                    "all": {
                      "played": 34,
                      "win": 17,
                      "draw": 10,
                      "lose": 7,
                      "goals": {
                        "for": 61,
                        "against": 37
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "home": {
                      "played": 17,
                      "win": 10,
                      "draw": 4,
                      "lose": 3,
                      "goals": {
                        "for": 32,
                        "against": 16
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "away": {
                      "played": 17,
                      "win": 7,
                      "draw": 6,
                      "lose": 4,
                      "goals": {
                        "for": 29,
                        "against": 21
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "update": "2021-05-26T00:00:00+00:00"
                  }.with_indifferent_access,
                  {
                    "rank": 5,
                    "team": {
                      "id": 169,
                      "name": "Eintracht Frankfurt",
                      "logo": "https://media.api-sports.io/football/teams/169.png"
                    }.with_indifferent_access,
                    "points": 60,
                    "goalsDiff": 16,
                    "group": "Bundesliga",
                    "form": "WLDLW",
                    "status": "same",
                    "description": "Promotion - Europa League (Group Stage)",
                    "all": {
                      "played": 34,
                      "win": 16,
                      "draw": 12,
                      "lose": 6,
                      "goals": {
                        "for": 69,
                        "against": 53
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "home": {
                      "played": 17,
                      "win": 10,
                      "draw": 7,
                      "lose": 0,
                      "goals": {
                        "for": 37,
                        "against": 20
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "away": {
                      "played": 17,
                      "win": 6,
                      "draw": 5,
                      "lose": 6,
                      "goals": {
                        "for": 32,
                        "against": 33
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "update": "2021-05-26T00:00:00+00:00"
                  }.with_indifferent_access,
                  {
                    "rank": 6,
                    "team": {
                      "id": 168,
                      "name": "Bayer Leverkusen",
                      "logo": "https://media.api-sports.io/football/teams/168.png"
                    }.with_indifferent_access,
                    "points": 52,
                    "goalsDiff": 14,
                    "group": "Bundesliga",
                    "form": "LDDWL",
                    "status": "same",
                    "description": "Promotion - Europa League (Group Stage)",
                    "all": {
                      "played": 34,
                      "win": 14,
                      "draw": 10,
                      "lose": 10,
                      "goals": {
                        "for": 53,
                        "against": 39
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "home": {
                      "played": 17,
                      "win": 8,
                      "draw": 5,
                      "lose": 4,
                      "goals": {
                        "for": 34,
                        "against": 22
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "away": {
                      "played": 17,
                      "win": 6,
                      "draw": 5,
                      "lose": 6,
                      "goals": {
                        "for": 19,
                        "against": 17
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "update": "2021-05-26T00:00:00+00:00"
                  }.with_indifferent_access,
                  {
                    "rank": 7,
                    "team": {
                      "id": 182,
                      "name": "Union Berlin",
                      "logo": "https://media.api-sports.io/football/teams/182.png"
                    }.with_indifferent_access,
                    "points": 50,
                    "goalsDiff": 7,
                    "group": "Bundesliga",
                    "form": "WDLWL",
                    "status": "same",
                    "description": "Promotion - Europa Conference League (Qualification)",
                    "all": {
                      "played": 34,
                      "win": 12,
                      "draw": 14,
                      "lose": 8,
                      "goals": {
                        "for": 50,
                        "against": 43
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "home": {
                      "played": 17,
                      "win": 8,
                      "draw": 8,
                      "lose": 1,
                      "goals": {
                        "for": 32,
                        "against": 18
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "away": {
                      "played": 17,
                      "win": 4,
                      "draw": 6,
                      "lose": 7,
                      "goals": {
                        "for": 18,
                        "against": 25
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "update": "2021-05-26T00:00:00+00:00"
                  }.with_indifferent_access,
                  {
                    "rank": 8,
                    "team": {
                      "id": 163,
                      "name": "Borussia Monchengladbach",
                      "logo": "https://media.api-sports.io/football/teams/163.png"
                    }.with_indifferent_access,
                    "points": 49,
                    "goalsDiff": 8,
                    "group": "Bundesliga",
                    "form": "WLLWL",
                    "status": "same",
                    "description": "",
                    "all": {
                      "played": 34,
                      "win": 13,
                      "draw": 10,
                      "lose": 11,
                      "goals": {
                        "for": 64,
                        "against": 56
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "home": {
                      "played": 17,
                      "win": 8,
                      "draw": 4,
                      "lose": 5,
                      "goals": {
                        "for": 32,
                        "against": 19
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "away": {
                      "played": 17,
                      "win": 5,
                      "draw": 6,
                      "lose": 6,
                      "goals": {
                        "for": 32,
                        "against": 37
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "update": "2021-05-26T00:00:00+00:00"
                  }.with_indifferent_access,
                  {
                    "rank": 9,
                    "team": {
                      "id": 172,
                      "name": "VfB Stuttgart",
                      "logo": "https://media.api-sports.io/football/teams/172.png"
                    }.with_indifferent_access,
                    "points": 45,
                    "goalsDiff": 1,
                    "group": "Bundesliga",
                    "form": "LWWLL",
                    "status": "same",
                    "description": "",
                    "all": {
                      "played": 34,
                      "win": 12,
                      "draw": 9,
                      "lose": 13,
                      "goals": {
                        "for": 56,
                        "against": 55
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "home": {
                      "played": 17,
                      "win": 5,
                      "draw": 6,
                      "lose": 6,
                      "goals": {
                        "for": 27,
                        "against": 26
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "away": {
                      "played": 17,
                      "win": 7,
                      "draw": 3,
                      "lose": 7,
                      "goals": {
                        "for": 29,
                        "against": 29
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "update": "2021-05-26T00:00:00+00:00"
                  }.with_indifferent_access,
                  {
                    "rank": 10,
                    "team": {
                      "id": 160,
                      "name": "SC Freiburg",
                      "logo": "https://media.api-sports.io/football/teams/160.png"
                    }.with_indifferent_access,
                    "points": 45,
                    "goalsDiff": 0,
                    "group": "Bundesliga",
                    "form": "LDWLD",
                    "status": "same",
                    "description": "",
                    "all": {
                      "played": 34,
                      "win": 12,
                      "draw": 9,
                      "lose": 13,
                      "goals": {
                        "for": 52,
                        "against": 52
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "home": {
                      "played": 17,
                      "win": 7,
                      "draw": 6,
                      "lose": 4,
                      "goals": {
                        "for": 33,
                        "against": 23
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "away": {
                      "played": 17,
                      "win": 5,
                      "draw": 3,
                      "lose": 9,
                      "goals": {
                        "for": 19,
                        "against": 29
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "update": "2021-05-26T00:00:00+00:00"
                  }.with_indifferent_access,
                  {
                    "rank": 11,
                    "team": {
                      "id": 167,
                      "name": "1899 Hoffenheim",
                      "logo": "https://media.api-sports.io/football/teams/167.png"
                    }.with_indifferent_access,
                    "points": 43,
                    "goalsDiff": -2,
                    "group": "Bundesliga",
                    "form": "WDWDW",
                    "status": "same",
                    "description": "",
                    "all": {
                      "played": 34,
                      "win": 11,
                      "draw": 10,
                      "lose": 13,
                      "goals": {
                        "for": 52,
                        "against": 54
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "home": {
                      "played": 17,
                      "win": 8,
                      "draw": 3,
                      "lose": 6,
                      "goals": {
                        "for": 32,
                        "against": 24
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "away": {
                      "played": 17,
                      "win": 3,
                      "draw": 7,
                      "lose": 7,
                      "goals": {
                        "for": 20,
                        "against": 30
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "update": "2021-05-26T00:00:00+00:00"
                  }.with_indifferent_access,
                  {
                    "rank": 12,
                    "team": {
                      "id": 164,
                      "name": "FSV Mainz 05",
                      "logo": "https://media.api-sports.io/football/teams/164.png"
                    }.with_indifferent_access,
                    "points": 39,
                    "goalsDiff": -17,
                    "group": "Bundesliga",
                    "form": "WLDDW",
                    "status": "same",
                    "description": "",
                    "all": {
                      "played": 34,
                      "win": 10,
                      "draw": 9,
                      "lose": 15,
                      "goals": {
                        "for": 39,
                        "against": 56
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "home": {
                      "played": 17,
                      "win": 4,
                      "draw": 4,
                      "lose": 9,
                      "goals": {
                        "for": 16,
                        "against": 26
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "away": {
                      "played": 17,
                      "win": 6,
                      "draw": 5,
                      "lose": 6,
                      "goals": {
                        "for": 23,
                        "against": 30
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "update": "2021-05-26T00:00:00+00:00"
                  }.with_indifferent_access,
                  {
                    "rank": 13,
                    "team": {
                      "id": 170,
                      "name": "FC Augsburg",
                      "logo": "https://media.api-sports.io/football/teams/170.png"
                    }.with_indifferent_access,
                    "points": 36,
                    "goalsDiff": -18,
                    "group": "Bundesliga",
                    "form": "LWLLL",
                    "status": "same",
                    "description": "",
                    "all": {
                      "played": 34,
                      "win": 10,
                      "draw": 6,
                      "lose": 18,
                      "goals": {
                        "for": 36,
                        "against": 54
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "home": {
                      "played": 17,
                      "win": 6,
                      "draw": 4,
                      "lose": 7,
                      "goals": {
                        "for": 21,
                        "against": 25
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "away": {
                      "played": 17,
                      "win": 4,
                      "draw": 2,
                      "lose": 11,
                      "goals": {
                        "for": 15,
                        "against": 29
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "update": "2021-05-26T00:00:00+00:00"
                  }.with_indifferent_access,
                  {
                    "rank": 14,
                    "team": {
                      "id": 159,
                      "name": "Hertha Berlin",
                      "logo": "https://media.api-sports.io/football/teams/159.png"
                    }.with_indifferent_access,
                    "points": 35,
                    "goalsDiff": -11,
                    "group": "Bundesliga",
                    "form": "LDWDW",
                    "status": "same",
                    "description": "",
                    "all": {
                      "played": 34,
                      "win": 8,
                      "draw": 11,
                      "lose": 15,
                      "goals": {
                        "for": 41,
                        "against": 52
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "home": {
                      "played": 17,
                      "win": 5,
                      "draw": 5,
                      "lose": 7,
                      "goals": {
                        "for": 21,
                        "against": 26
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "away": {
                      "played": 17,
                      "win": 3,
                      "draw": 6,
                      "lose": 8,
                      "goals": {
                        "for": 20,
                        "against": 26
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "update": "2021-05-26T00:00:00+00:00"
                  }.with_indifferent_access,
                  {
                    "rank": 15,
                    "team": {
                      "id": 188,
                      "name": "Arminia Bielefeld",
                      "logo": "https://media.api-sports.io/football/teams/188.png"
                    }.with_indifferent_access,
                    "points": 35,
                    "goalsDiff": -26,
                    "group": "Bundesliga",
                    "form": "WDDLW",
                    "status": "same",
                    "description": "",
                    "all": {
                      "played": 34,
                      "win": 9,
                      "draw": 8,
                      "lose": 17,
                      "goals": {
                        "for": 26,
                        "against": 52
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "home": {
                      "played": 17,
                      "win": 6,
                      "draw": 2,
                      "lose": 9,
                      "goals": {
                        "for": 13,
                        "against": 23
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "away": {
                      "played": 17,
                      "win": 3,
                      "draw": 6,
                      "lose": 8,
                      "goals": {
                        "for": 13,
                        "against": 29
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "update": "2021-05-26T00:00:00+00:00"
                  }.with_indifferent_access,
                  {
                    "rank": 16,
                    "team": {
                      "id": 192,
                      "name": "FC Koln",
                      "logo": "https://media.api-sports.io/football/teams/192.png"
                    }.with_indifferent_access,
                    "points": 33,
                    "goalsDiff": -26,
                    "group": "Bundesliga",
                    "form": "WDLWW",
                    "status": "same",
                    "description": "Bundesliga (Relegation)",
                    "all": {
                      "played": 34,
                      "win": 8,
                      "draw": 9,
                      "lose": 17,
                      "goals": {
                        "for": 34,
                        "against": 60
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "home": {
                      "played": 17,
                      "win": 3,
                      "draw": 5,
                      "lose": 9,
                      "goals": {
                        "for": 20,
                        "against": 31
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "away": {
                      "played": 17,
                      "win": 5,
                      "draw": 4,
                      "lose": 8,
                      "goals": {
                        "for": 14,
                        "against": 29
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "update": "2021-05-26T00:00:00+00:00"
                  }.with_indifferent_access,
                  {
                    "rank": 17,
                    "team": {
                      "id": 162,
                      "name": "Werder Bremen",
                      "logo": "https://media.api-sports.io/football/teams/162.png"
                    }.with_indifferent_access,
                    "points": 31,
                    "goalsDiff": -21,
                    "group": "Bundesliga",
                    "form": "LLDLL",
                    "status": "same",
                    "description": "Relegation - 2. Bundesliga",
                    "all": {
                      "played": 34,
                      "win": 7,
                      "draw": 10,
                      "lose": 17,
                      "goals": {
                        "for": 36,
                        "against": 57
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "home": {
                      "played": 17,
                      "win": 3,
                      "draw": 5,
                      "lose": 9,
                      "goals": {
                        "for": 16,
                        "against": 28
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "away": {
                      "played": 17,
                      "win": 4,
                      "draw": 5,
                      "lose": 8,
                      "goals": {
                        "for": 20,
                        "against": 29
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "update": "2021-05-26T00:00:00+00:00"
                  }.with_indifferent_access,
                  {
                    "rank": 18,
                    "team": {
                      "id": 174,
                      "name": "FC Schalke 04",
                      "logo": "https://media.api-sports.io/football/teams/174.png"
                    }.with_indifferent_access,
                    "points": 16,
                    "goalsDiff": -61,
                    "group": "Bundesliga",
                    "form": "LWLLL",
                    "status": "same",
                    "description": "Relegation - 2. Bundesliga",
                    "all": {
                      "played": 34,
                      "win": 3,
                      "draw": 7,
                      "lose": 24,
                      "goals": {
                        "for": 25,
                        "against": 86
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "home": {
                      "played": 17,
                      "win": 3,
                      "draw": 3,
                      "lose": 11,
                      "goals": {
                        "for": 14,
                        "against": 34
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "away": {
                      "played": 17,
                      "win": 0,
                      "draw": 4,
                      "lose": 13,
                      "goals": {
                        "for": 11,
                        "against": 52
                      }.with_indifferent_access
                    }.with_indifferent_access,
                    "update": "2021-05-26T00:00:00+00:00"
                  }.with_indifferent_access
                ]
              ]
      }.with_indifferent_access
    }.with_indifferent_access
  ]
end
