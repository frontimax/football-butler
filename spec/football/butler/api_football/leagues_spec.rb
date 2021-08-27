# frozen_string_literal: true

RSpec.describe Football::Butler::Leagues do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_API_FOOTBALL,
      api_name: :api_football_com
    )

    stubs_leagues_api_dash
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_country_name' do
    it 'returns leagues' do
      response = described_class.by_country_name(name: 'Germany')

      expect(response).to be_a(Array)
      expect(response).to match(response_league_api_dash)
    end
  end

  describe 'when by_id' do
    it 'returns league' do
      response = described_class.by_id(id: 78)

      expect(response).to be_a(Array)
      expect(response).to include(response_league_by_id_api_dash.stringify_keys)
    end

    it 'returns league' do
      response = Football::Butler::Competitions.by_id(id: 78)

      expect(response).to be_a(Array)
      expect(response).to include(response_league_by_id_api_dash.stringify_keys)
    end
  end

  describe 'when all_seasons' do
    it 'returns leagues' do
      response = described_class.all_seasons

      expect(response).to be_a(Array)
      expect(response).to match(response_league_seasons_api_dash)
    end
  end

  describe 'when all' do
    it 'returns all leagues' do
      response = described_class.all

      expect(response).to be_a(Array)
      expect(response).to match(response_league_api_dash)
    end
  end

  describe 'when all with result parsed_response' do
    it 'returns all leagues' do
      response = described_class.all(result: :parsed_response)

      expect(response).to be_a(Hash)
      expect(response['response']).to be_a(Array)
      expect(response['response']).to match(response_league_api_dash)
    end
  end

  describe 'when all with result data' do
    it 'returns all leagues' do
      response = described_class.all(result: :data)

      expect(response).to be_a(Array)
      expect(response).to match(response_league_api_dash)
    end
  end

  describe 'when all with result response' do
    it 'returns all leagues' do
      response = described_class.all(result: :response)

      expect(response).to be_a(Array)
      expect(response).to match(response_league_api_dash)
    end
  end

  describe 'when search_by_name' do
    it 'returns leagues' do
      response = described_class.search_by_name(name: 'Bundes')

      expect(response).to be_a(Array)
      expect(response).to match(response_league_api_dash)
    end
  end

  describe 'when all_leagues' do
    it 'returns leagues' do
      response = described_class.all_leagues

      expect(response).to be_a(Array)
      expect(response).to match(response_league_api_dash)
    end
  end

  describe 'when all_cups' do
    it 'returns leagues' do
      response = described_class.all_cups

      expect(response).to be_a(Array)
      expect(response).to match(response_league_api_dash)
    end
  end
end

def stubs_leagues_api_dash
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/leagues?country=Germany")
    .to_return(status: 200, body: get_mocked_response('leagues.json', :api_football))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/leagues?id=78")
    .to_return(status: 200, body: get_mocked_response('league.json', :api_football))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/leagues/seasons")
    .to_return(status: 200, body: get_mocked_response('league_seasons.json', :api_football))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/leagues")
    .to_return(status: 200, body: get_mocked_response('leagues.json', :api_football))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/leagues?type=league")
    .to_return(status: 200, body: get_mocked_response('leagues.json', :api_football))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/leagues?type=cup")
    .to_return(status: 200, body: get_mocked_response('leagues.json', :api_football))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/leagues?search=Bundes")
    .to_return(status: 200, body: get_mocked_response('leagues.json', :api_football))
end

def response_league_api_dash
  [
    {
      "league": {
                  "id": 78,
                  "name": "Bundesliga 1",
                  "type": "League",
                  "logo": "https://media.api-sports.io/football/leagues/78.png"
                }.with_indifferent_access,
      "country": {
                  "name": "Germany",
                  "code": "DE",
                  "flag": "https://media.api-sports.io/flags/de.svg"
                }.with_indifferent_access,
      "seasons": [
                  {
                    "year": 2020,
                    "start": "2020-09-18",
                    "end": "2021-05-29",
                    "current": false,
                    "coverage": {
                              "fixtures": {
                                "events": true,
                                "lineups": true,
                                "statistics_fixtures": true,
                                "statistics_players": true
                              },
                              "standings": true,
                              "players": true,
                              "top_scorers": true,
                              "top_assists": true,
                              "top_cards": true,
                              "injuries": true,
                              "predictions": true,
                              "odds": false
                            }.with_indifferent_access
                  }.with_indifferent_access,
                  {
                    "year": 2021,
                    "start": "2021-08-13",
                    "end": "2022-05-14",
                    "current": true,
                    "coverage": {
                              "fixtures": {
                                "events": true,
                                "lineups": true,
                                "statistics_fixtures": true,
                                "statistics_players": true
                              },
                              "standings": true,
                              "players": true,
                              "top_scorers": true,
                              "top_assists": true,
                              "top_cards": true,
                              "injuries": false,
                              "predictions": true,
                              "odds": true
                            }.with_indifferent_access
                  }.with_indifferent_access
                ]
    }.with_indifferent_access
  ]
end

def response_league_by_id_api_dash
  {
    "league": {
                "id": 78,
                "name": "Bundesliga 1",
                "type": "League",
                "logo": "https://media.api-sports.io/football/leagues/78.png"
              }.with_indifferent_access,
    "country": {
                "name": "Germany",
                "code": "DE",
                "flag": "https://media.api-sports.io/flags/de.svg"
              }.with_indifferent_access,
    "seasons": [
                {
                  "year": 2020,
                  "start": "2020-09-18",
                  "end": "2021-05-29",
                  "current": false,
                  "coverage": {
                            "fixtures": {
                              "events": true,
                              "lineups": true,
                              "statistics_fixtures": true,
                              "statistics_players": true
                            },
                            "standings": true,
                            "players": true,
                            "top_scorers": true,
                            "top_assists": true,
                            "top_cards": true,
                            "injuries": true,
                            "predictions": true,
                            "odds": false
                          }.with_indifferent_access
                }.with_indifferent_access,
                {
                  "year": 2021,
                  "start": "2021-08-13",
                  "end": "2022-05-14",
                  "current": true,
                  "coverage": {
                            "fixtures": {
                              "events": true,
                              "lineups": true,
                              "statistics_fixtures": true,
                              "statistics_players": true
                            },
                            "standings": true,
                            "players": true,
                            "top_scorers": true,
                            "top_assists": true,
                            "top_cards": true,
                            "injuries": false,
                            "predictions": true,
                            "odds": true
                          }.with_indifferent_access
                }.with_indifferent_access
              ]
  }.with_indifferent_access
end

def response_league_seasons_api_dash
  [
    2008,
    2009,
    2010,
    2011,
    2012,
    2013,
    2014,
    2015,
    2016,
    2017,
    2018,
    2019,
    2020,
    2021,
    2022,
    2023
  ]
end