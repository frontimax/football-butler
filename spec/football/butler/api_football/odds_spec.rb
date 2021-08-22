# frozen_string_literal: true

RSpec.describe Football::Butler::Odds do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_API_FOOTBALL,
      api_name: :api_football_com
    )
    
    stubs_odds_api_football
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_match' do
    context 'success' do
      it 'returns odd' do
        response = described_class.by_match(id: 719371)

        expect(response).to be_a(Array)
        expect(response).to match_array(response_odds_api_football)
      end
    end
  end
end

def stubs_odds_api_football
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/odds?fixture=719371")
    .to_return(status: 200, body: get_mocked_response('odds.json', :api_football))
end

def response_odds_api_football
  [
    {
      "league": {
        "id": 78,
        "name": "Bundesliga 1",
        "country": "Germany",
        "logo": "https://media.api-sports.io/football/leagues/78.png",
        "flag": "https://media.api-sports.io/flags/de.svg",
        "season": 2021
      }.with_indifferent_access,
      "fixture": {
        "id": 719371,
        "timezone": "UTC",
        "date": "2021-08-28T13:30:00+00:00",
        "timestamp": 1630157400
      }.with_indifferent_access,
      "update": "2021-08-22T00:25:48+00:00",
      "bookmakers": [
                  {
                    "id": 6,
                    "name": "Bwin",
                    "bets": [
                            {
                              "id": 1,
                              "name": "Match Winner",
                              "values": [
                                      {
                                        "value": "Home",
                                        "odd": "2.00"
                                      }.with_indifferent_access,
                                      {
                                        "value": "Draw",
                                        "odd": "3.60"
                                      }.with_indifferent_access,
                                      {
                                        "value": "Away",
                                        "odd": "3.40"
                                      }.with_indifferent_access
                                    ]
                            }.with_indifferent_access
                          ]
                  }.with_indifferent_access
                ]
    }.with_indifferent_access
  ]
end
