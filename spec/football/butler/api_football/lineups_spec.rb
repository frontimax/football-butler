# frozen_string_literal: true

RSpec.describe Football::Butler::Lineups do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_API_FOOTBALL,
      api_name: :api_football_com
    )

    stubs_lineups_api_football
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_id' do
    it 'returns one lineup' do
      response = described_class.by_match(id: 587177)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_lineup_api_football)
    end
  end
end

def stubs_lineups_api_football
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/fixtures/lineups?fixture=587177")
    .to_return(status: 200, body: get_mocked_response('lineup.json', :api_football))
end

def response_lineup_api_football
  [
    {
      "team": {
        "id": 165,
        "name": "Borussia Dortmund",
        "logo": "https://media.api-sports.io/football/teams/165.png",
        "colors": ""
      }.with_indifferent_access,
      "coach": {
        "id": 1530,
        "name": "L. Favre",
        "photo": "https://media.api-sports.io/football/coachs/1530.png"
      }.with_indifferent_access,
      "formation": "3-4-1-2",
      "startXI": [
                {
                  "player": {
                    "id": 1,
                    "name": "R. Bürki",
                    "number": 1,
                    "pos": "G",
                    "grid": "1:1"
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 501,
                    "name": "M. Hummels",
                    "number": 15,
                    "pos": "D",
                    "grid": "2:3"
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 5,
                    "name": "M. Akanji",
                    "number": 16,
                    "pos": "D",
                    "grid": "2:2"
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 20,
                    "name": "A. Witsel",
                    "number": 28,
                    "pos": "M",
                    "grid": "2:1"
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 264,
                    "name": "T. Meunier",
                    "number": 24,
                    "pos": "M",
                    "grid": "3:4"
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 2929,
                    "name": "T. Hazard",
                    "number": 10,
                    "pos": "M",
                    "grid": "3:3"
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 864,
                    "name": "E. Can",
                    "number": 23,
                    "pos": "D",
                    "grid": "3:2"
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 18,
                    "name": "J. Sancho",
                    "number": 7,
                    "pos": "F",
                    "grid": "3:1"
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 161921,
                    "name": "G. Reyna",
                    "number": 32,
                    "pos": "F",
                    "grid": "4:1"
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 129718,
                    "name": "J. Bellingham",
                    "number": 22,
                    "pos": "M",
                    "grid": "5:2"
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 1100,
                    "name": "E. Håland",
                    "number": 9,
                    "pos": "F",
                    "grid": "5:1"
                  }.with_indifferent_access
                }.with_indifferent_access
              ],
      "substitutes": [
                {
                  "player": {
                    "id": 19068,
                    "name": "F. Passlack",
                    "number": 30,
                    "pos": "M",
                    "grid": ""
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 15,
                    "name": "T. Delaney",
                    "number": 6,
                    "pos": "M",
                    "grid": ""
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 25,
                    "name": "M. Reus",
                    "number": 11,
                    "pos": "F",
                    "grid": ""
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 984,
                    "name": "J. Brandt",
                    "number": 19,
                    "pos": "F",
                    "grid": ""
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 10166,
                    "name": "Reinier",
                    "number": 20,
                    "pos": "M",
                    "grid": ""
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 2,
                    "name": "M. Hitz",
                    "number": 35,
                    "pos": "G",
                    "grid": ""
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 26,
                    "name": "M. Wolf",
                    "number": 27,
                    "pos": "F",
                    "grid": ""
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 14,
                    "name": "M. Dahoud",
                    "number": 8,
                    "pos": "M",
                    "grid": ""
                  }.with_indifferent_access
                }.with_indifferent_access
              ]
    }.with_indifferent_access,
    {
      "team": {
        "id": 163,
        "name": "Borussia Monchengladbach",
        "logo": "https://media.api-sports.io/football/teams/163.png",
        "colors": ""
      }.with_indifferent_access,
      "coach": {
        "id": 1540,
        "name": "M. Rose",
        "photo": "https://media.api-sports.io/football/coachs/1540.png"
      }.with_indifferent_access,
      "formation": "3-4-3",
      "startXI": [
                {
                  "player": {
                    "id": 2802,
                    "name": "Y. Sommer",
                    "number": 1,
                    "pos": "G",
                    "grid": "1:1"
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 25633,
                    "name": "O. Wendt",
                    "number": 17,
                    "pos": "M",
                    "grid": "2:3"
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 1082,
                    "name": "S. Lainer",
                    "number": 18,
                    "pos": "M",
                    "grid": "2:2"
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 2915,
                    "name": "M. Ginter",
                    "number": 28,
                    "pos": "D",
                    "grid": "2:1"
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 2803,
                    "name": "N. Elvedi",
                    "number": 30,
                    "pos": "D",
                    "grid": "3:4"
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 2194,
                    "name": "R. Bensebaini",
                    "number": 25,
                    "pos": "D",
                    "grid": "3:3"
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 25639,
                    "name": "L. Stindl",
                    "number": 13,
                    "pos": "F",
                    "grid": "3:2"
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 25637,
                    "name": "C. Kramer",
                    "number": 6,
                    "pos": "M",
                    "grid": "3:1"
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 25635,
                    "name": "J. Hofmann",
                    "number": 23,
                    "pos": "F",
                    "grid": "4:3"
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 25638,
                    "name": "F. Neuhaus",
                    "number": 32,
                    "pos": "M",
                    "grid": "4:2"
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 1103,
                    "name": "H. Wolf",
                    "number": 11,
                    "pos": "F",
                    "grid": "4:1"
                  }.with_indifferent_access
                }.with_indifferent_access
              ],
      "substitutes": [
                {
                  "player": {
                    "id": 21509,
                    "name": "M. Thuram",
                    "number": 10,
                    "pos": "F",
                    "grid": ""
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 25646,
                    "name": "A. Plea",
                    "number": 14,
                    "pos": "F",
                    "grid": ""
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 25644,
                    "name": "P. Herrmann",
                    "number": 7,
                    "pos": "F",
                    "grid": ""
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 25645,
                    "name": "T. Müsel",
                    "number": 26,
                    "pos": "M",
                    "grid": ""
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 203007,
                    "name": "R. Reitz",
                    "number": 43,
                    "pos": "M",
                    "grid": ""
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 25630,
                    "name": "T. Jantschke",
                    "number": 24,
                    "pos": "D",
                    "grid": ""
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 25627,
                    "name": "T. Sippel",
                    "number": 21,
                    "pos": "G",
                    "grid": ""
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 25647,
                    "name": "I. Traoré",
                    "number": 16,
                    "pos": "F",
                    "grid": ""
                  }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "player": {
                    "id": 2805,
                    "name": "M. Lang",
                    "number": 3,
                    "pos": "D",
                    "grid": ""
                  }.with_indifferent_access
                }.with_indifferent_access
              ]
    }.with_indifferent_access
  ]
end
