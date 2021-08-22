# frozen_string_literal: true

RSpec.describe Football::Butler::Predictions do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_API_FOOTBALL,
      api_name: :api_football_com
    )

    stubs_predictions_api_football
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_match' do
    it 'returns one prediction' do
      response = described_class.by_match(id: 719371)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_prediction_api_football)
    end
  end
end

def stubs_predictions_api_football
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/predictions?fixture=719371")
    .to_return(status: 200, body: get_mocked_response('predictions.json', :api_football))
end

def response_prediction_api_football
  [
    {
      "predictions": {
        "winner": {
          "id": 160,
          "name": "SC Freiburg",
          "comment": "Win or draw"
        }.with_indifferent_access,
        "win_or_draw": true,
        "under_over": "",
        "goals": {
          "home": "-3.5",
          "away": "-1.5"
        }.with_indifferent_access,
        "advice": "Double chance : draw or SC Freiburg",
        "percent": {
          "home": "10%",
          "draw": "45%",
          "away": "45%"
        }.with_indifferent_access
      }.with_indifferent_access,
      "league": {
        "id": 78,
        "name": "Bundesliga 1",
        "country": "Germany",
        "logo": "https://media.api-sports.io/football/leagues/78.png",
        "flag": "https://media.api-sports.io/flags/de.svg",
        "season": 2021
      }.with_indifferent_access,
      "teams": {
        "home": {
          "id": 172,
          "name": "VfB Stuttgart",
          "logo": "https://media.api-sports.io/football/teams/172.png",
          "last_5": {
            "form": "50%",
            "att": "36%",
            "def": "64%",
            "goals": {
              "for": {
                "total": 5,
                "average": "2.5"
              }.with_indifferent_access,
              "against": {
                "total": 5,
                "average": "2.5"
              }.with_indifferent_access
            }.with_indifferent_access
          }.with_indifferent_access,
          "league": {
            "form": "WL",
            "fixtures": {
              "played": {
                "home": 1,
                "away": 1,
                "total": 2
              }.with_indifferent_access,
              "wins": {
                "home": 1,
                "away": 0,
                "total": 1
              }.with_indifferent_access,
              "draws": {
                "home": 0,
                "away": 0,
                "total": 0
              }.with_indifferent_access,
              "loses": {
                "home": 0,
                "away": 1,
                "total": 1
              }.with_indifferent_access
            }.with_indifferent_access,
            "goals": {
              "for": {
                "total": {
                  "home": 5,
                  "away": 0,
                  "total": 5
                }.with_indifferent_access,
                "average": {
                  "home": "5.0",
                  "away": "0.0",
                  "total": "2.5"
                }.with_indifferent_access,
                "minute": {
                  "0-15": {
                    "total": "",
                    "percentage": ""
                  }.with_indifferent_access,
                  "16-30": {
                    "total": 1,
                    "percentage": "20.00%"
                  }.with_indifferent_access,
                  "31-45": {
                    "total": 1,
                    "percentage": "20.00%"
                  }.with_indifferent_access,
                  "46-60": {
                    "total": 1,
                    "percentage": "20.00%"
                  }.with_indifferent_access,
                  "61-75": {
                    "total": 1,
                    "percentage": "20.00%"
                  }.with_indifferent_access,
                  "76-90": {
                    "total": 1,
                    "percentage": "20.00%"
                  }.with_indifferent_access,
                  "91-105": {
                    "total": "",
                    "percentage": ""
                  }.with_indifferent_access,
                  "106-120": {
                    "total": "",
                    "percentage": ""
                  }.with_indifferent_access
                }.with_indifferent_access
              }.with_indifferent_access,
              "against": {
                "total": {
                  "home": 1,
                  "away": 4,
                  "total": 5
                }.with_indifferent_access,
                "average": {
                  "home": "1.0",
                  "away": "4.0",
                  "total": "2.5"
                }.with_indifferent_access,
                "minute": {
                  "0-15": {
                    "total": "",
                    "percentage": ""
                  }.with_indifferent_access,
                  "16-30": {
                    "total": "",
                    "percentage": ""
                  }.with_indifferent_access,
                  "31-45": {
                    "total": 1,
                    "percentage": "20.00%"
                  }.with_indifferent_access,
                  "46-60": {
                    "total": 2,
                    "percentage": "40.00%"
                  }.with_indifferent_access,
                  "61-75": {
                    "total": 1,
                    "percentage": "20.00%"
                  }.with_indifferent_access,
                  "76-90": {
                    "total": "",
                    "percentage": ""
                  }.with_indifferent_access,
                  "91-105": {
                    "total": 1,
                    "percentage": "20.00%"
                  }.with_indifferent_access,
                  "106-120": {
                    "total": "",
                    "percentage": ""
                  }.with_indifferent_access
                }.with_indifferent_access
              }.with_indifferent_access
            }.with_indifferent_access,
            "biggest": {
              "streak": {
                "wins": 1,
                "draws": 0,
                "loses": 0
              }.with_indifferent_access,
              "wins": {
                "home": "5-1",
                "away": ""
              }.with_indifferent_access,
              "loses": {
                "home": "",
                "away": "4-0"
              }.with_indifferent_access,
              "goals": {
                "for": {
                  "home": 5,
                  "away": 0
                }.with_indifferent_access,
                "against": {
                  "home": 1,
                  "away": 4
                }.with_indifferent_access
              }.with_indifferent_access
            }.with_indifferent_access,
            "clean_sheet": {
              "home": 0,
              "away": 0,
              "total": 0
            }.with_indifferent_access,
            "failed_to_score": {
              "home": 0,
              "away": 1,
              "total": 1
            }.with_indifferent_access,
            "penalty": {
              "scored": {
                "total": 0,
                "percentage": "0%"
              }.with_indifferent_access,
              "missed": {
                "total": 0,
                "percentage": "0%"
              }.with_indifferent_access,
              "total": 0
            }.with_indifferent_access,
            "lineups": [
                      {
                        "formation": "3-4-2-1",
                        "played": 2
                      }.with_indifferent_access
                    ],
            "cards": {
              "yellow": {
                "0-15": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access,
                "16-30": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access,
                "31-45": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access,
                "46-60": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access,
                "61-75": {
                  "total": 3,
                  "percentage": "100.00%"
                }.with_indifferent_access,
                "76-90": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access,
                "91-105": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access,
                "106-120": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access
              }.with_indifferent_access,
              "red": {
                "0-15": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access,
                "16-30": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access,
                "31-45": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access,
                "46-60": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access,
                "61-75": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access,
                "76-90": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access,
                "91-105": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access,
                "106-120": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access
              }.with_indifferent_access
            }.with_indifferent_access
          }.with_indifferent_access
        }.with_indifferent_access,
        "away": {
          "id": 160,
          "name": "SC Freiburg",
          "logo": "https://media.api-sports.io/football/teams/160.png",
          "last_5": {
            "form": "67%",
            "att": "14%",
            "def": "93%",
            "goals": {
              "for": {
                "total": 2,
                "average": "1.0"
              }.with_indifferent_access,
              "against": {
                "total": 1,
                "average": "0.5"
              }.with_indifferent_access
            }.with_indifferent_access
          }.with_indifferent_access,
          "league": {
            "form": "DW",
            "fixtures": {
              "played": {
                "home": 1,
                "away": 1,
                "total": 2
              }.with_indifferent_access,
              "wins": {
                "home": 1,
                "away": 0,
                "total": 1
              }.with_indifferent_access,
              "draws": {
                "home": 0,
                "away": 1,
                "total": 1
              }.with_indifferent_access,
              "loses": {
                "home": 0,
                "away": 0,
                "total": 0
              }.with_indifferent_access
            }.with_indifferent_access,
            "goals": {
              "for": {
                "total": {
                  "home": 2,
                  "away": 0,
                  "total": 2
                }.with_indifferent_access,
                "average": {
                  "home": "2.0",
                  "away": "0.0",
                  "total": "1.0"
                }.with_indifferent_access,
                "minute": {
                  "0-15": {
                    "total": 1,
                    "percentage": "33.33%"
                  }.with_indifferent_access,
                  "16-30": {
                    "total": "",
                    "percentage": ""
                  }.with_indifferent_access,
                  "31-45": {
                    "total": "",
                    "percentage": ""
                  }.with_indifferent_access,
                  "46-60": {
                    "total": 2,
                    "percentage": "66.67%"
                  }.with_indifferent_access,
                  "61-75": {
                    "total": "",
                    "percentage": ""
                  }.with_indifferent_access,
                  "76-90": {
                    "total": "",
                    "percentage": ""
                  }.with_indifferent_access,
                  "91-105": {
                    "total": "",
                    "percentage": ""
                  }.with_indifferent_access,
                  "106-120": {
                    "total": "",
                    "percentage": ""
                  }.with_indifferent_access
                }.with_indifferent_access
              }.with_indifferent_access,
              "against": {
                "total": {
                  "home": 1,
                  "away": 0,
                  "total": 1
                }.with_indifferent_access,
                "average": {
                  "home": "1.0",
                  "away": "0.0",
                  "total": "0.5"
                }.with_indifferent_access,
                "minute": {
                  "0-15": {
                    "total": "",
                    "percentage": ""
                  }.with_indifferent_access,
                  "16-30": {
                    "total": "",
                    "percentage": ""
                  }.with_indifferent_access,
                  "31-45": {
                    "total": "",
                    "percentage": ""
                  }.with_indifferent_access,
                  "46-60": {
                    "total": "",
                    "percentage": ""
                  }.with_indifferent_access,
                  "61-75": {
                    "total": "",
                    "percentage": ""
                  }.with_indifferent_access,
                  "76-90": {
                    "total": "",
                    "percentage": ""
                  }.with_indifferent_access,
                  "91-105": {
                    "total": "",
                    "percentage": ""
                  }.with_indifferent_access,
                  "106-120": {
                    "total": "",
                    "percentage": ""
                  }.with_indifferent_access
                }.with_indifferent_access
              }.with_indifferent_access
            }.with_indifferent_access,
            "biggest": {
              "streak": {
                "wins": 0,
                "draws": 1,
                "loses": 0
              }.with_indifferent_access,
              "wins": {
                "home": "2-1",
                "away": ""
              }.with_indifferent_access,
              "loses": {
                "home": "",
                "away": ""
              }.with_indifferent_access,
              "goals": {
                "for": {
                  "home": 2,
                  "away": 0
                }.with_indifferent_access,
                "against": {
                  "home": 1,
                  "away": 0
                }.with_indifferent_access
              }.with_indifferent_access
            }.with_indifferent_access,
            "clean_sheet": {
              "home": 0,
              "away": 1,
              "total": 1
            }.with_indifferent_access,
            "failed_to_score": {
              "home": 0,
              "away": 1,
              "total": 1
            }.with_indifferent_access,
            "penalty": {
              "scored": {
                "total": 0,
                "percentage": "0%"
              }.with_indifferent_access,
              "missed": {
                "total": 0,
                "percentage": "0%"
              }.with_indifferent_access,
              "total": 0
            }.with_indifferent_access,
            "lineups": [
                      {
                        "formation": "3-4-2-1",
                        "played": 1
                      }.with_indifferent_access,
                      {
                        "formation": "4-4-2",
                        "played": 1
                      }.with_indifferent_access
                    ],
            "cards": {
              "yellow": {
                "0-15": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access,
                "16-30": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access,
                "31-45": {
                  "total": 2,
                  "percentage": "40.00%"
                }.with_indifferent_access,
                "46-60": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access,
                "61-75": {
                  "total": 1,
                  "percentage": "20.00%"
                }.with_indifferent_access,
                "76-90": {
                  "total": 1,
                  "percentage": "20.00%"
                }.with_indifferent_access,
                "91-105": {
                  "total": 1,
                  "percentage": "20.00%"
                }.with_indifferent_access,
                "106-120": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access
              }.with_indifferent_access,
              "red": {
                "0-15": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access,
                "16-30": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access,
                "31-45": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access,
                "46-60": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access,
                "61-75": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access,
                "76-90": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access,
                "91-105": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access,
                "106-120": {
                  "total": "",
                  "percentage": ""
                }.with_indifferent_access
              }.with_indifferent_access
            }.with_indifferent_access
          }.with_indifferent_access
        }.with_indifferent_access
      }.with_indifferent_access,
      "comparison": {
        "form": {
          "home": "43%",
          "away": "57%"
        }.with_indifferent_access,
        "att": {
          "home": "71%",
          "away": "29%"
        }.with_indifferent_access,
        "def": {
          "home": "17%",
          "away": "83%"
        }.with_indifferent_access,
        "poisson_distribution": {
          "home": "0%",
          "away": "0%"
        }.with_indifferent_access,
        "h2h": {
          "home": "38%",
          "away": "62%"
        }.with_indifferent_access,
        "goals": {
          "home": "47%",
          "away": "53%"
        }.with_indifferent_access,
        "total": {
          "home": "43.2%",
          "away": "56.8%"
        }.with_indifferent_access
      }.with_indifferent_access,
      "h2h": [
                       {
                         "fixture": {
                           "id": 587332,
                           "referee": "T. Stieler",
                           "timezone": "UTC",
                           "date": "2021-01-23T14:30:00+00:00",
                           "timestamp": 1611412200,
                           "periods": {
                             "first": 1611412200,
                             "second": 1611415800
                           }.with_indifferent_access,
                           "venue": {
                             "id": 716,
                             "name": "Schwarzwald-Stadion",
                             "city": "Freiburg im Breisgau"
                           }.with_indifferent_access,
                           "status": {
                             "long": "Match Finished",
                             "short": "FT",
                             "elapsed": 90
                           }.with_indifferent_access
                         }.with_indifferent_access,
                         "league": {
                           "id": 78,
                           "name": "Bundesliga 1",
                           "country": "Germany",
                           "logo": "https://media.api-sports.io/football/leagues/78.png",
                           "flag": "https://media.api-sports.io/flags/de.svg",
                           "season": 2020,
                           "round": "Regular Season - 18"
                         }.with_indifferent_access,
                         "teams": {
                           "home": {
                             "id": 160,
                             "name": "SC Freiburg",
                             "logo": "https://media.api-sports.io/football/teams/160.png",
                             "winner": true
                           }.with_indifferent_access,
                           "away": {
                             "id": 172,
                             "name": "VfB Stuttgart",
                             "logo": "https://media.api-sports.io/football/teams/172.png",
                             "winner": false
                           }.with_indifferent_access
                         }.with_indifferent_access,
                         "goals": {
                           "home": 2,
                           "away": 1
                         }.with_indifferent_access,
                         "score": {
                           "halftime": {
                             "home": 2,
                             "away": 1
                           }.with_indifferent_access,
                           "fulltime": {
                             "home": 2,
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
                       }.with_indifferent_access,
                       {
                         "fixture": {
                           "id": 646330,
                           "referee": "F. Brych",
                           "timezone": "UTC",
                           "date": "2020-12-23T19:45:00+00:00",
                           "timestamp": 1608752700,
                           "periods": {
                             "first": 1608752700,
                             "second": 1608756300
                           }.with_indifferent_access,
                           "venue": {
                             "id": 750,
                             "name": "Mercedes-Benz-Arena",
                             "city": "Stuttgart"
                           }.with_indifferent_access,
                           "status": {
                             "long": "Match Finished",
                             "short": "FT",
                             "elapsed": 90
                           }.with_indifferent_access
                         }.with_indifferent_access,
                         "league": {
                           "id": 81,
                           "name": "DFB Pokal",
                           "country": "Germany",
                           "logo": "https://media.api-sports.io/football/leagues/81.png",
                           "flag": "https://media.api-sports.io/flags/de.svg",
                           "season": 2020,
                           "round": "2nd Round"
                         }.with_indifferent_access,
                         "teams": {
                           "home": {
                             "id": 172,
                             "name": "VfB Stuttgart",
                             "logo": "https://media.api-sports.io/football/teams/172.png",
                             "winner": true
                           }.with_indifferent_access,
                           "away": {
                             "id": 160,
                             "name": "SC Freiburg",
                             "logo": "https://media.api-sports.io/football/teams/160.png",
                             "winner": false
                           }.with_indifferent_access
                         }.with_indifferent_access,
                         "goals": {
                           "home": 1,
                           "away": 0
                         }.with_indifferent_access,
                         "score": {
                           "halftime": {
                             "home": 1,
                             "away": 0
                           }.with_indifferent_access,
                           "fulltime": {
                             "home": 1,
                             "away": 0
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
                       }.with_indifferent_access,
                       {
                         "fixture": {
                           "id": 587184,
                           "referee": "B. Cortus",
                           "timezone": "UTC",
                           "date": "2020-09-19T13:30:00+00:00",
                           "timestamp": 1600522200,
                           "periods": {
                             "first": 1600522200,
                             "second": 1600525800
                           }.with_indifferent_access,
                           "venue": {
                             "id": 750,
                             "name": "Mercedes-Benz-Arena",
                             "city": "Stuttgart"
                           }.with_indifferent_access,
                           "status": {
                             "long": "Match Finished",
                             "short": "FT",
                             "elapsed": 90
                           }.with_indifferent_access
                         }.with_indifferent_access,
                         "league": {
                           "id": 78,
                           "name": "Bundesliga 1",
                           "country": "Germany",
                           "logo": "https://media.api-sports.io/football/leagues/78.png",
                           "flag": "https://media.api-sports.io/flags/de.svg",
                           "season": 2020,
                           "round": "Regular Season - 1"
                         }.with_indifferent_access,
                         "teams": {
                           "home": {
                             "id": 172,
                             "name": "VfB Stuttgart",
                             "logo": "https://media.api-sports.io/football/teams/172.png",
                             "winner": false
                           }.with_indifferent_access,
                           "away": {
                             "id": 160,
                             "name": "SC Freiburg",
                             "logo": "https://media.api-sports.io/football/teams/160.png",
                             "winner": true
                           }.with_indifferent_access
                         }.with_indifferent_access,
                         "goals": {
                           "home": 2,
                           "away": 3
                         }.with_indifferent_access,
                         "score": {
                           "halftime": {
                             "home": 0,
                             "away": 2
                           }.with_indifferent_access,
                           "fulltime": {
                             "home": 2,
                             "away": 3
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
                       }.with_indifferent_access,
                       {
                         "fixture": {
                           "id": 2696,
                           "referee": "Deniz Aytekin, Germany",
                           "timezone": "UTC",
                           "date": "2019-02-03T17:00:00+00:00",
                           "timestamp": 1549213200,
                           "periods": {
                             "first": 1549213200,
                             "second": 1549216800
                           }.with_indifferent_access,
                           "venue": {
                             "id": 750,
                             "name": "Mercedes-Benz Arena",
                             "city": "Stuttgart"
                           }.with_indifferent_access,
                           "status": {
                             "long": "Match Finished",
                             "short": "FT",
                             "elapsed": 90
                           }.with_indifferent_access
                         }.with_indifferent_access,
                         "league": {
                           "id": 78,
                           "name": "Bundesliga 1",
                           "country": "Germany",
                           "logo": "https://media.api-sports.io/football/leagues/78.png",
                           "flag": "https://media.api-sports.io/flags/de.svg",
                           "season": 2018,
                           "round": "Regular Season - 20"
                         }.with_indifferent_access,
                         "teams": {
                           "home": {
                             "id": 172,
                             "name": "VfB Stuttgart",
                             "logo": "https://media.api-sports.io/football/teams/172.png",
                             "winner": ""
                           }.with_indifferent_access,
                           "away": {
                             "id": 160,
                             "name": "SC Freiburg",
                             "logo": "https://media.api-sports.io/football/teams/160.png",
                             "winner": ""
                           }.with_indifferent_access
                         }.with_indifferent_access,
                         "goals": {
                           "home": 2,
                           "away": 2
                         }.with_indifferent_access,
                         "score": {
                           "halftime": {
                             "home": 0,
                             "away": 1
                           }.with_indifferent_access,
                           "fulltime": {
                             "home": 2,
                             "away": 2
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
                       }.with_indifferent_access,
                       {
                         "fixture": {
                           "id": 2543,
                           "referee": "Deniz Aytekin, Germany",
                           "timezone": "UTC",
                           "date": "2018-09-16T16:00:00+00:00",
                           "timestamp": 1537113600,
                           "periods": {
                             "first": 1537113600,
                             "second": 1537117200
                           }.with_indifferent_access,
                           "venue": {
                             "id": "",
                             "name": "Schwarzwald-Stadion",
                             "city": "Freiburg"
                           }.with_indifferent_access,
                           "status": {
                             "long": "Match Finished",
                             "short": "FT",
                             "elapsed": 90
                           }.with_indifferent_access
                         }.with_indifferent_access,
                         "league": {
                           "id": 78,
                           "name": "Bundesliga 1",
                           "country": "Germany",
                           "logo": "https://media.api-sports.io/football/leagues/78.png",
                           "flag": "https://media.api-sports.io/flags/de.svg",
                           "season": 2018,
                           "round": "Regular Season - 3"
                         }.with_indifferent_access,
                         "teams": {
                           "home": {
                             "id": 160,
                             "name": "SC Freiburg",
                             "logo": "https://media.api-sports.io/football/teams/160.png",
                             "winner": ""
                           }.with_indifferent_access,
                           "away": {
                             "id": 172,
                             "name": "VfB Stuttgart",
                             "logo": "https://media.api-sports.io/football/teams/172.png",
                             "winner": ""
                           }.with_indifferent_access
                         }.with_indifferent_access,
                         "goals": {
                           "home": 3,
                           "away": 3
                         }.with_indifferent_access,
                         "score": {
                           "halftime": {
                             "home": 1,
                             "away": 1
                           }.with_indifferent_access,
                           "fulltime": {
                             "home": 3,
                             "away": 3
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
                       }.with_indifferent_access,
                       {
                         "fixture": {
                           "id": 10991,
                           "referee": "Benjamin Brand, Germany",
                           "timezone": "UTC",
                           "date": "2018-03-16T19:30:00+00:00",
                           "timestamp": 1521228600,
                           "periods": {
                             "first": 1521228600,
                             "second": 1521232200
                           }.with_indifferent_access,
                           "venue": {
                             "id": "",
                             "name": "Schwarzwald-Stadion",
                             "city": "Freiburg"
                           }.with_indifferent_access,
                           "status": {
                             "long": "Match Finished",
                             "short": "FT",
                             "elapsed": 90
                           }.with_indifferent_access
                         }.with_indifferent_access,
                         "league": {
                           "id": 78,
                           "name": "Bundesliga 1",
                           "country": "Germany",
                           "logo": "https://media.api-sports.io/football/leagues/78.png",
                           "flag": "https://media.api-sports.io/flags/de.svg",
                           "season": 2017,
                           "round": "Regular Season - 27"
                         }.with_indifferent_access,
                         "teams": {
                           "home": {
                             "id": 160,
                             "name": "SC Freiburg",
                             "logo": "https://media.api-sports.io/football/teams/160.png",
                             "winner": false
                           }.with_indifferent_access,
                           "away": {
                             "id": 172,
                             "name": "VfB Stuttgart",
                             "logo": "https://media.api-sports.io/football/teams/172.png",
                             "winner": true
                           }.with_indifferent_access
                         }.with_indifferent_access,
                         "goals": {
                           "home": 1,
                           "away": 2
                         }.with_indifferent_access,
                         "score": {
                           "halftime": {
                             "home": 0,
                             "away": 1
                           }.with_indifferent_access,
                           "fulltime": {
                             "home": 1,
                             "away": 2
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
                       }.with_indifferent_access,
                       {
                         "fixture": {
                           "id": 11136,
                           "referee": "Tobias Stieler, Germany",
                           "timezone": "UTC",
                           "date": "2017-10-29T17:00:00+00:00",
                           "timestamp": 1509296400,
                           "periods": {
                             "first": 1509296400,
                             "second": 1509300000
                           }.with_indifferent_access,
                           "venue": {
                             "id": 750,
                             "name": "Mercedes-Benz Arena",
                             "city": "Stuttgart"
                           }.with_indifferent_access,
                           "status": {
                             "long": "Match Finished",
                             "short": "FT",
                             "elapsed": 90
                           }.with_indifferent_access
                         }.with_indifferent_access,
                         "league": {
                           "id": 78,
                           "name": "Bundesliga 1",
                           "country": "Germany",
                           "logo": "https://media.api-sports.io/football/leagues/78.png",
                           "flag": "https://media.api-sports.io/flags/de.svg",
                           "season": 2017,
                           "round": "Regular Season - 10"
                         }.with_indifferent_access,
                         "teams": {
                           "home": {
                             "id": 172,
                             "name": "VfB Stuttgart",
                             "logo": "https://media.api-sports.io/football/teams/172.png",
                             "winner": true
                           }.with_indifferent_access,
                           "away": {
                             "id": 160,
                             "name": "SC Freiburg",
                             "logo": "https://media.api-sports.io/football/teams/160.png",
                             "winner": false
                           }.with_indifferent_access
                         }.with_indifferent_access,
                         "goals": {
                           "home": 3,
                           "away": 0
                         }.with_indifferent_access,
                         "score": {
                           "halftime": {
                             "home": 2,
                             "away": 0
                           }.with_indifferent_access,
                           "fulltime": {
                             "home": 3,
                             "away": 0
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
                       }.with_indifferent_access,
                       {
                         "fixture": {
                           "id": 195137,
                           "referee": "",
                           "timezone": "UTC",
                           "date": "2015-04-25T13:30:00+00:00",
                           "timestamp": 1429968600,
                           "periods": {
                             "first": 1429968600,
                             "second": 1429972200
                           }.with_indifferent_access,
                           "venue": {
                             "id": "",
                             "name": "Mercedes-Benz-Arena (Stuttgart)",
                             "city": ""
                           }.with_indifferent_access,
                           "status": {
                             "long": "Match Finished",
                             "short": "FT",
                             "elapsed": 90
                           }.with_indifferent_access
                         }.with_indifferent_access,
                         "league": {
                           "id": 78,
                           "name": "Bundesliga 1",
                           "country": "Germany",
                           "logo": "https://media.api-sports.io/football/leagues/78.png",
                           "flag": "https://media.api-sports.io/flags/de.svg",
                           "season": 2014,
                           "round": "Regular Season - 30"
                         }.with_indifferent_access,
                         "teams": {
                           "home": {
                             "id": 172,
                             "name": "VfB Stuttgart",
                             "logo": "https://media.api-sports.io/football/teams/172.png",
                             "winner": ""
                           }.with_indifferent_access,
                           "away": {
                             "id": 160,
                             "name": "SC Freiburg",
                             "logo": "https://media.api-sports.io/football/teams/160.png",
                             "winner": ""
                           }.with_indifferent_access
                         }.with_indifferent_access,
                         "goals": {
                           "home": 2,
                           "away": 2
                         }.with_indifferent_access,
                         "score": {
                           "halftime": {
                             "home": 2,
                             "away": 0
                           }.with_indifferent_access,
                           "fulltime": {
                             "home": 2,
                             "away": 2
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
                       }.with_indifferent_access,
                       {
                         "fixture": {
                           "id": 194981,
                           "referee": "",
                           "timezone": "UTC",
                           "date": "2014-11-28T19:30:00+00:00",
                           "timestamp": 1417203000,
                           "periods": {
                             "first": 1417203000,
                             "second": 1417206600
                           }.with_indifferent_access,
                           "venue": {
                             "id": "",
                             "name": "Schwarzwald-Stadion (Freiburg im Breisgau)",
                             "city": ""
                           }.with_indifferent_access,
                           "status": {
                             "long": "Match Finished",
                             "short": "FT",
                             "elapsed": 90
                           }.with_indifferent_access
                         }.with_indifferent_access,
                         "league": {
                           "id": 78,
                           "name": "Bundesliga 1",
                           "country": "Germany",
                           "logo": "https://media.api-sports.io/football/leagues/78.png",
                           "flag": "https://media.api-sports.io/flags/de.svg",
                           "season": 2014,
                           "round": "Regular Season - 13"
                         }.with_indifferent_access,
                         "teams": {
                           "home": {
                             "id": 160,
                             "name": "SC Freiburg",
                             "logo": "https://media.api-sports.io/football/teams/160.png",
                             "winner": false
                           }.with_indifferent_access,
                           "away": {
                             "id": 172,
                             "name": "VfB Stuttgart",
                             "logo": "https://media.api-sports.io/football/teams/172.png",
                             "winner": true
                           }.with_indifferent_access
                         }.with_indifferent_access,
                         "goals": {
                           "home": 1,
                           "away": 4
                         }.with_indifferent_access,
                         "score": {
                           "halftime": {
                             "home": 1,
                             "away": 1
                           }.with_indifferent_access,
                           "fulltime": {
                             "home": 1,
                             "away": 4
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
                       }.with_indifferent_access,
                       {
                         "fixture": {
                           "id": 195432,
                           "referee": "",
                           "timezone": "UTC",
                           "date": "2014-04-05T13:30:00+00:00",
                           "timestamp": 1396704600,
                           "periods": {
                             "first": 1396704600,
                             "second": 1396708200
                           }.with_indifferent_access,
                           "venue": {
                             "id": "",
                             "name": "Mercedes-Benz-Arena (Stuttgart)",
                             "city": ""
                           }.with_indifferent_access,
                           "status": {
                             "long": "Match Finished",
                             "short": "FT",
                             "elapsed": 90
                           }.with_indifferent_access
                         }.with_indifferent_access,
                         "league": {
                           "id": 78,
                           "name": "Bundesliga 1",
                           "country": "Germany",
                           "logo": "https://media.api-sports.io/football/leagues/78.png",
                           "flag": "https://media.api-sports.io/flags/de.svg",
                           "season": 2013,
                           "round": "Regular Season - 29"
                         }.with_indifferent_access,
                         "teams": {
                           "home": {
                             "id": 172,
                             "name": "VfB Stuttgart",
                             "logo": "https://media.api-sports.io/football/teams/172.png",
                             "winner": true
                           }.with_indifferent_access,
                           "away": {
                             "id": 160,
                             "name": "SC Freiburg",
                             "logo": "https://media.api-sports.io/football/teams/160.png",
                             "winner": false
                           }.with_indifferent_access
                         }.with_indifferent_access,
                         "goals": {
                           "home": 2,
                           "away": 0
                         }.with_indifferent_access,
                         "score": {
                           "halftime": {
                             "home": 0,
                             "away": 0
                           }.with_indifferent_access,
                           "fulltime": {
                             "home": 2,
                             "away": 0
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
    }.with_indifferent_access
  ]
end
