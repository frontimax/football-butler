# frozen_string_literal: true

RSpec.describe Football::Butler::Injuries do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_API_FOOTBALL,
      api_name: :api_football_com
    )

    stubs_injuries
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_competition_and_season' do
    context 'success' do
      it 'returns injuries' do
        response = described_class.by_competition_and_season(competition: 78, season: 2021)

        expect(response).to be_a(Array)
        expect(response).to match_array(response_injuries)
      end
    end
  end

  describe 'when by_match' do
    context 'success' do
      it 'returns injuries' do
        response = described_class.by_match(id: 1)

        expect(response).to be_a(Array)
        expect(response).to match_array(response_injuries)
      end
    end
  end

  describe 'when by_team_and_season' do
    context 'success' do
      it 'returns injuries' do
        response = described_class.by_team_and_season(team: 78, season: 2021)

        expect(response).to be_a(Array)
        expect(response).to match_array(response_injuries)
      end
    end
  end
end

def stubs_injuries
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/injuries?league=78&season=2021")
    .to_return(status: 200, body: get_mocked_response('injuries.json', :api_football))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/injuries?fixture=1")
    .to_return(status: 200, body: get_mocked_response('injuries.json', :api_football))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/injuries?season=2021&team=78")
    .to_return(status: 200, body: get_mocked_response('injuries.json', :api_football))
end

def response_injuries
  [
    {
      "player": {
        "id": 25333,
        "name": "R. Jarstein",
        "photo": "https://media.api-sports.io/football/players/25333.png",
        "type": "Missing Fixture",
        "reason": "Heart Problems"
      }.with_indifferent_access,
      "team": {
        "id": 159,
        "name": "Hertha Berlin",
        "logo": "https://media.api-sports.io/football/teams/159.png"
      }.with_indifferent_access,
      "fixture": {
        "id": 719364,
        "timezone": "UTC",
        "date": "2021-08-21T13:30:00+00:00",
        "timestamp": 1629552600
      }.with_indifferent_access,
      "league": {
        "id": 78,
        "season": 2021,
        "name": "Bundesliga 1",
        "country": "Germany",
        "logo": "https://media.api-sports.io/football/leagues/78.png",
        "flag": "https://media.api-sports.io/flags/de.svg"
      }.with_indifferent_access
    }.with_indifferent_access,
    {
      "player": {
        "id": 1651,
        "name": "K. Piatek",
        "photo": "https://media.api-sports.io/football/players/1651.png",
        "type": "Missing Fixture",
        "reason": "Ankle Injury"
      }.with_indifferent_access,
      "team": {
        "id": 159,
        "name": "Hertha Berlin",
        "logo": "https://media.api-sports.io/football/teams/159.png"
      }.with_indifferent_access,
      "fixture": {
        "id": 719364,
        "timezone": "UTC",
        "date": "2021-08-21T13:30:00+00:00",
        "timestamp": 1629552600
      }.with_indifferent_access,
      "league": {
        "id": 78,
        "season": 2021,
        "name": "Bundesliga 1",
        "country": "Germany",
        "logo": "https://media.api-sports.io/football/leagues/78.png",
        "flag": "https://media.api-sports.io/flags/de.svg"
      }.with_indifferent_access
    }.with_indifferent_access,
    {
      "player": {
        "id": 148284,
        "name": "B. Bialek",
        "photo": "https://media.api-sports.io/football/players/148284.png",
        "type": "Missing Fixture",
        "reason": "Knee Injury"
      }.with_indifferent_access,
      "team": {
        "id": 161,
        "name": "VfL Wolfsburg",
        "logo": "https://media.api-sports.io/football/teams/161.png"
      }.with_indifferent_access,
      "fixture": {
        "id": 719364,
        "timezone": "UTC",
        "date": "2021-08-21T13:30:00+00:00",
        "timestamp": 1629552600
      }.with_indifferent_access,
      "league": {
        "id": 78,
        "season": 2021,
        "name": "Bundesliga 1",
        "country": "Germany",
        "logo": "https://media.api-sports.io/football/leagues/78.png",
        "flag": "https://media.api-sports.io/flags/de.svg"
      }.with_indifferent_access
    }.with_indifferent_access,
    {
      "player": {
        "id": 25208,
        "name": "P. Otavio",
        "photo": "https://media.api-sports.io/football/players/25208.png",
        "type": "Missing Fixture",
        "reason": "Ankle Injury"
      }.with_indifferent_access,
      "team": {
        "id": 161,
        "name": "VfL Wolfsburg",
        "logo": "https://media.api-sports.io/football/teams/161.png"
      }.with_indifferent_access,
      "fixture": {
        "id": 719364,
        "timezone": "UTC",
        "date": "2021-08-21T13:30:00+00:00",
        "timestamp": 1629552600
      }.with_indifferent_access,
      "league": {
        "id": 78,
        "season": 2021,
        "name": "Bundesliga 1",
        "country": "Germany",
        "logo": "https://media.api-sports.io/football/leagues/78.png",
        "flag": "https://media.api-sports.io/flags/de.svg"
      }.with_indifferent_access
    }.with_indifferent_access
  ]
end
