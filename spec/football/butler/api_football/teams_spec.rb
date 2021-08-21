# frozen_string_literal: true

RSpec.describe Football::Butler::Teams do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_API_FOOTBALL,
      api_name: :api_football_com
    )

    stubs_teams_api_football
  end

  describe 'when by_id' do
    it 'returns one team' do
      response = described_class.by_id(id: 39)

      expect(response.parsed_response['response']).to be_a(Array)
      expect(response.parsed_response['response']).to match_array(response_team_api_football)
    end
  end

  describe 'when by_name' do
    it 'returns one team' do
      response = described_class.by_name(name: 'Wolves')

      expect(response.parsed_response['response']).to be_a(Array)
      expect(response.parsed_response['response']).to match_array(response_team_api_football)
    end
  end

  describe 'when by_country' do
    it 'returns teams' do
      response = described_class.by_country_name(name: 'Germany')

      expect(response.parsed_response['response']).to be_a(Array)
      expect(response.parsed_response['response']).to match_array(response_teams_api_football)
    end
  end

  describe 'when by_competition_and_year' do
    it 'returns all teams of a competition by a season starting year' do
      response = described_class.by_competition_and_year(id: 2002, year: 2019)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_team_api_football)
    end
  end
end

def stubs_teams_api_football
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/teams?id=39")
    .to_return(status: 200, body: get_mocked_response('team.json', :api_football))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/teams?name=Wolves")
    .to_return(status: 200, body: get_mocked_response('team.json', :api_football))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/teams?country=Germany")
    .to_return(status: 200, body: get_mocked_response('teams.json', :api_football))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/teams?league=2002&season=2019")
    .to_return(status: 200, body: get_mocked_response('team.json', :api_football))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/competitions/2002/teams?year=2019")
    .to_return(status: 200, body: get_mocked_response('teams_filter_year.json', :api_football))
end

def response_team_api_football
  [
    {
      "team": {
        "id": 39,
        "name": "Wolves",
        "country": "England",
        "founded": 1877,
        "national": false,
        "logo": "https://media.api-sports.io/football/teams/39.png"
      }.with_indifferent_access,
      "venue": {
        "id": 600,
        "name": "Molineux Stadium",
        "address": "Waterloo Road",
        "city": "Wolverhampton, West Midlands",
        "capacity": 32050,
        "surface": "grass",
        "image": "https://media.api-sports.io/football/venues/600.png"
      }.with_indifferent_access
    }.with_indifferent_access
  ]
end

def response_teams_api_football
  [
    {
      "team": {
        "id": 25,
        "name": "Germany",
        "country": "Germany",
        "founded": 1900,
        "national": true,
        "logo": "https://media.api-sports.io/football/teams/25.png"
              }.with_indifferent_access,
      "venue": {
        "id": 694,
        "name": "Olympiastadion Berlin",
        "address": "Olympischer Platz 3",
        "city": "Berlin",
        "capacity": 77116,
        "surface": "grass",
        "image": "https://media.api-sports.io/football/venues/694.png"
               }.with_indifferent_access
    }.with_indifferent_access,
    {
      "team": {
        "id": 157,
        "name": "Bayern Munich",
        "country": "Germany",
        "founded": 1900,
        "national": false,
        "logo": "https://media.api-sports.io/football/teams/157.png"
              }.with_indifferent_access,
      "venue": {
        "id": 700,
        "name": "Allianz Arena",
        "address": "Werner-Heisenberg-Allee 25",
        "city": "München",
        "capacity": 75000,
        "surface": "grass",
        "image": "https://media.api-sports.io/football/venues/700.png"
               }.with_indifferent_access
    }.with_indifferent_access
  ]
end
