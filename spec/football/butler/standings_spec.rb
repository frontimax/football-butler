# frozen_string_literal: true

RSpec.describe Football::Butler::Standings do
  before do
    stubs_standing
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_competition' do
    it 'returns standings of competition' do
      response = described_class.by_competition(id: 2002)
      expect(response).to match_array(response_standings)
    end
  end

  describe 'when home_by_competition' do
    it 'returns standings of home competition' do
      response = described_class.home_by_competition(id: 2002)
      expect(response).to match_array(response_standings_home)
    end
  end

  describe 'when away_by_competition' do
    it 'returns standings of away competition' do
      response = described_class.away_by_competition(id: 2002)
      expect(response).to match_array(response_standings_away)
    end
  end

  describe 'when by_competition_and_year' do
    it 'returns standings of competition by season year' do
      response = described_class.by_competition_and_year(id: 2002, year: '2020')
      expect(response).to match_array(response_standings)
    end
  end
end

def stubs_standing
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/competitions/2002/standings")
    .to_return(status: 200, body: get_mocked_response('standings.json'))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/competitions/2002/standings?standingType=HOME")
    .to_return(status: 200, body: get_mocked_response('standings_home.json'))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/competitions/2002/standings?standingType=AWAY")
    .to_return(status: 200, body: get_mocked_response('standings_away.json'))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/competitions/2002/standings?season=2020")
    .to_return(status: 200, body: get_mocked_response('standings_2020.json'))
end

def response_standings
  [
    {
      "stage": "REGULAR_SEASON",
      "type": "TOTAL",
      "group": "null",
      "table": [
        {
          "position": 1,
          "team": {
            "id": 5,
            "name": "FC Bayern München",
            "crestUrl": "https://crests.football-data.org/5.svg"
          }.with_indifferent_access,
          "playedGames": 28,
          "form": "W,W,W,W,W",
          "won": 20,
          "draw": 5,
          "lost": 3,
          "points": 65,
          "goalsFor": 79,
          "goalsAgainst": 35,
          "goalDifference": 44
        }.with_indifferent_access,
        {
          "position": 2,
          "team": {
            "id": 721,
            "name": "RB Leipzig",
            "crestUrl": "https://crests.football-data.org/721.svg"
          }.with_indifferent_access,
          "playedGames": 28,
          "form": "L,W,D,W,W",
          "won": 18,
          "draw": 6,
          "lost": 4,
          "points": 60,
          "goalsFor": 50,
          "goalsAgainst": 22,
          "goalDifference": 28
        }.with_indifferent_access,
        {
          "position": 3,
          "team": {
            "id": 11,
            "name": "VfL Wolfsburg",
            "crestUrl": "https://crests.football-data.org/11.svg"
          }.with_indifferent_access,
          "playedGames": 28,
          "form": "W,W,W,L,W",
          "won": 15,
          "draw": 9,
          "lost": 4,
          "points": 54,
          "goalsFor": 47,
          "goalsAgainst": 24,
          "goalDifference": 23
        }.with_indifferent_access
      ]
    }.with_indifferent_access
  ]
end

def response_standings_home
  [
    {
      "stage": "REGULAR_SEASON",
      "type": "HOME",
      "group": "null",
      "table": [
        {
          "position": 1,
          "team": {
            "id": 5,
            "name": "FC Bayern München",
            "crestUrl": "https://crests.football-data.org/5.svg"
          }.with_indifferent_access,
          "playedGames": 28,
          "form": "W,W,W,W,W",
          "won": 20,
          "draw": 5,
          "lost": 3,
          "points": 65,
          "goalsFor": 79,
          "goalsAgainst": 35,
          "goalDifference": 44
        }.with_indifferent_access,
        {
          "position": 2,
          "team": {
            "id": 721,
            "name": "RB Leipzig",
            "crestUrl": "https://crests.football-data.org/721.svg"
          }.with_indifferent_access,
          "playedGames": 28,
          "form": "L,W,D,W,W",
          "won": 18,
          "draw": 6,
          "lost": 4,
          "points": 60,
          "goalsFor": 50,
          "goalsAgainst": 22,
          "goalDifference": 28
        }.with_indifferent_access,
        {
          "position": 3,
          "team": {
            "id": 11,
            "name": "VfL Wolfsburg",
            "crestUrl": "https://crests.football-data.org/11.svg"
          }.with_indifferent_access,
          "playedGames": 28,
          "form": "W,W,W,L,W",
          "won": 15,
          "draw": 9,
          "lost": 4,
          "points": 54,
          "goalsFor": 47,
          "goalsAgainst": 24,
          "goalDifference": 23
        }.with_indifferent_access
      ]
    }.with_indifferent_access
  ]
end

def response_standings_away
  [
    {
      "stage": "REGULAR_SEASON",
      "type": "AWAY",
      "group": "null",
      "table": [
        {
          "position": 1,
          "team": {
            "id": 5,
            "name": "FC Bayern München",
            "crestUrl": "https://crests.football-data.org/5.svg"
          }.with_indifferent_access,
          "playedGames": 28,
          "form": "W,W,W,W,W",
          "won": 20,
          "draw": 5,
          "lost": 3,
          "points": 65,
          "goalsFor": 79,
          "goalsAgainst": 35,
          "goalDifference": 44
        }.with_indifferent_access,
        {
          "position": 2,
          "team": {
            "id": 721,
            "name": "RB Leipzig",
            "crestUrl": "https://crests.football-data.org/721.svg"
          }.with_indifferent_access,
          "playedGames": 28,
          "form": "L,W,D,W,W",
          "won": 18,
          "draw": 6,
          "lost": 4,
          "points": 60,
          "goalsFor": 50,
          "goalsAgainst": 22,
          "goalDifference": 28
        }.with_indifferent_access,
        {
          "position": 3,
          "team": {
            "id": 11,
            "name": "VfL Wolfsburg",
            "crestUrl": "https://crests.football-data.org/11.svg"
          }.with_indifferent_access,
          "playedGames": 28,
          "form": "W,W,W,L,W",
          "won": 15,
          "draw": 9,
          "lost": 4,
          "points": 54,
          "goalsFor": 47,
          "goalsAgainst": 24,
          "goalDifference": 23
        }.with_indifferent_access
      ]
    }.with_indifferent_access
  ]
end

