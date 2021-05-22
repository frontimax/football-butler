# frozen_string_literal: true

RSpec.describe Football::Butler::Events do
  before do
    stubs_matches
  end

  describe 'when by_id' do
    it 'returns one match' do
      response = described_class.by_id(id: 2002)

      expect(response).to be_a(HTTParty::Response)
      expect(response.parsed_response).to include(response_match.stringify_keys)
    end
  end

  describe 'when all' do
    it 'returns all matches' do
      response = described_class.all

      expect(response).to be_a(Array)
      expect(response).to match_array(response_matches)
    end

    it 'returns all matches with result param :default' do
      response = described_class.all(result: :default)

      expect(response).to be_a(HTTParty::Response)
      expect(response.parsed_response).to be_a(Hash)
      expect(response.parsed_response).to include(response_matches_all.stringify_keys)
    end
  end

  describe 'when by_competition' do
    it 'returns all matches of competition' do
      response = described_class.by_competition(id: 2002)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_matches_more)
    end
  end

  describe 'when by_competition_and_year' do
    it 'returns all matches of competition and season year' do
      response = described_class.by_competition_and_year(id: 2002, year: 2020)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_matches_more)
    end
  end

  describe 'when by_competition_and_match_day' do
    it 'returns all matches of competition and season year' do
      response = described_class.by_competition_and_match_day(id: 2002, match_day: 1)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_matches_more)
    end
  end

  describe 'when by_team' do
    it 'returns all matches of a team' do
      response = described_class.by_team(id: 2002)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_matches_more)
    end
  end

  describe 'when by_team_finished' do
    it 'returns all finished matches of a team' do
      response = described_class.by_team_finished(id: 2002)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_matches_more)
    end
  end

  describe 'when by_team_and_status' do
    it 'returns all scheduled matches of a team' do
      response = described_class.by_team_and_status(
        id: 2002, status: Football::Butler::FootballData::Matches::STATUS_FINISHED
      )

      expect(response).to be_a(Array)
      expect(response).to match_array(response_matches_more)
    end
  end

  describe 'when by_team_scheduled' do
    it 'returns all scheduled matches of a team' do
      response = described_class.by_team_scheduled(id: 2002)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_matches_more)
    end
  end
end

def stubs_matches
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/matches/2002")
    .to_return(status: 200, body: get_mocked_response('match.json', :football_data))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/matches/9999")
    .to_return(status: 200, body: get_mocked_response('resource_missing.json', :football_data))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/matches")
    .to_return(status: 200, body: get_mocked_response('matches.json', :football_data))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/competitions/2002/matches")
    .to_return(status: 200, body: get_mocked_response('matches_more.json', :football_data))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/competitions/2002/matches?season=2020")
    .to_return(status: 200, body: get_mocked_response('matches_more.json', :football_data))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/competitions/2002/matches?matchday=1")
    .to_return(status: 200, body: get_mocked_response('matches_more.json', :football_data))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/teams/2002/matches")
    .to_return(status: 200, body: get_mocked_response('matches_more.json', :football_data))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/teams/2002/matches?status=FINISHED")
    .to_return(status: 200, body: get_mocked_response('matches_more.json', :football_data))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/teams/2002/matches?status=SCHEDULED")
    .to_return(status: 200, body: get_mocked_response('matches_more.json', :football_data))
end

def response_missing
  {
    message: 'The resource you are looking for does not exist.'
  }.with_indifferent_access
end

def response_match
  {
    "head2head": {
      "numberOfMatches": 10,
      "totalGoals": 34,
      "homeTeam": {
        "id": 10,
        "name": "VfB Stuttgart",
        "wins": 1,
        "draws": 0,
        "losses": 9
      }.with_indifferent_access,
      "awayTeam": {
        "id": 5,
        "name": "FC Bayern München",
        "wins": 9,
        "draws": 0,
        "losses": 1
      }
    }.with_indifferent_access,
    "match": {
      "id": 2002,
      "competition": {
        "id": 2002,
        "name": "Bundesliga",
        "area": {
          "name": "Germany",
          "code": "DEU",
          "ensignUrl": "https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg"
        }
      }.with_indifferent_access,
      "season": {
        "id": 228,
        "startDate": "2002-08-09",
        "endDate": "2003-05-24",
        "currentMatchday": "null",
        "winner": {
          "id": 5,
          "name": "FC Bayern München",
          "shortName": "Bayern M",
          "tla": "FCB",
          "crestUrl": "https://crests.football-data.org/5.svg"
        }
      }.with_indifferent_access,
      "utcDate": "2002-12-07T15:30:00Z",
      "status": "FINISHED",
      "venue": "null",
      "matchday": 16,
      "stage": "null",
      "group": "null",
      "lastUpdated": "2018-07-12T16:27:45Z",
      "odds": {
        "msg": "Activate Odds-Package in User-Panel to retrieve odds."
      }.with_indifferent_access,
      "score": {
        "winner": "AWAY_TEAM",
        "duration": "REGULAR",
        "fullTime": {
          "homeTeam": 0,
          "awayTeam": 3
        }.with_indifferent_access,
        "halfTime": {
          "homeTeam": "null",
          "awayTeam": "null"
        }.with_indifferent_access,
        "extraTime": {
          "homeTeam": "null",
          "awayTeam": "null"
        }.with_indifferent_access,
        "penalties": {
          "homeTeam": "null",
          "awayTeam": "null"
        }
      }.with_indifferent_access,
      "homeTeam": {
        "id": 10,
        "name": "VfB Stuttgart"
      }.with_indifferent_access,
      "awayTeam": {
        "id": 5,
        "name": "FC Bayern München"
      }.with_indifferent_access,
      "referees": []
    }
  }.with_indifferent_access
end

def response_matches_all
  {
    "count": 0,
    "filters": {
      "dateFrom": "2021-03-27",
      "dateTo": "2021-03-27",
      "permission": "TIER_ONE"
    }.with_indifferent_access,
    "matches": []
  }
end

def response_matches
  []
end

def response_matches_more
  [
    {
      "id": 303007,
      "season": {
        "id": 599,
        "startDate": "2020-09-18",
        "endDate": "2021-05-15",
        "currentMatchday": 27
      }.with_indifferent_access,
      "utcDate": "2020-09-18T18:30:00Z",
      "status": "FINISHED",
      "matchday": 1,
      "stage": "REGULAR_SEASON",
      "group": "Regular Season",
      "lastUpdated": "2020-10-03T07:30:16Z",
      "odds": {
        "msg": "Activate Odds-Package in User-Panel to retrieve odds."
      }.with_indifferent_access,
      "score": {
        "winner": "HOME_TEAM",
        "duration": "REGULAR",
        "fullTime": {
          "homeTeam": 8,
          "awayTeam": 0
        }.with_indifferent_access,
        "halfTime": {
          "homeTeam": 3,
          "awayTeam": 0
        }.with_indifferent_access,
        "extraTime": {
          "homeTeam": "null",
          "awayTeam": "null"
        }.with_indifferent_access,
        "penalties": {
          "homeTeam": "null",
          "awayTeam": "null"
        }
      }.with_indifferent_access,
      "homeTeam": {
        "id": 5,
        "name": "FC Bayern München"
      }.with_indifferent_access,
      "awayTeam": {
        "id": 6,
        "name": "FC Schalke 04"
      }.with_indifferent_access,
      "referees": [
        {
          "id": 43878,
          "name": "Felix Zwayer",
          "role": "REF",
          "nationality": "Germany"
        }.with_indifferent_access,
        {
          "id": 43923,
          "name": "Thorsten Schiffner",
          "role": "REF",
          "nationality": "Germany"
        }.with_indifferent_access,
        {
          "id": 43879,
          "name": "Marco Achmüller",
          "role": "REF",
          "nationality": "Germany"
        }.with_indifferent_access,
        {
          "id": 57517,
          "name": "Daniel Schlager",
          "role": "REF",
          "nationality": "Germany"
        }.with_indifferent_access,
        {
          "id": 57539,
          "name": "Tobias Welz",
          "role": "REF",
          "nationality": "Germany"
        }
      ]
    }.with_indifferent_access,
    {
      "id": 303002,
      "season": {
        "id": 599,
        "startDate": "2020-09-18",
        "endDate": "2021-05-15",
        "currentMatchday": 27
      }.with_indifferent_access,
      "utcDate": "2020-09-19T13:30:00Z",
      "status": "FINISHED",
      "matchday": 1,
      "stage": "REGULAR_SEASON",
      "group": "Regular Season",
      "lastUpdated": "2020-10-03T07:30:16Z",
      "odds": {
        "msg": "Activate Odds-Package in User-Panel to retrieve odds."
      }.with_indifferent_access,
      "score": {
        "winner": "AWAY_TEAM",
        "duration": "REGULAR",
        "fullTime": {
          "homeTeam": 2,
          "awayTeam": 3
        }.with_indifferent_access,
        "halfTime": {
          "homeTeam": 1,
          "awayTeam": 2
        }.with_indifferent_access,
        "extraTime": {
          "homeTeam": "null",
          "awayTeam": "null"
        }.with_indifferent_access,
        "penalties": {
          "homeTeam": "null",
          "awayTeam": "null"
        }.with_indifferent_access
      }.with_indifferent_access,
      "homeTeam": {
        "id": 1,
        "name": "1. FC Köln"
      }.with_indifferent_access,
      "awayTeam": {
        "id": 2,
        "name": "TSG 1899 Hoffenheim"
      }.with_indifferent_access,
      "referees": [
        {
          "id": 15408,
          "name": "Daniel Siebert",
          "role": "REF",
          "nationality": "Germany"
        }.with_indifferent_access,
        {
          "id": 8826,
          "name": "Christian Dietz",
          "role": "REF",
          "nationality": "Germany"
        }.with_indifferent_access,
        {
          "id": 57525,
          "name": "Marcel Pelgrim",
          "role": "REF",
          "nationality": "Germany"
        }.with_indifferent_access,
        {
          "id": 57515,
          "name": "Sören Storks",
          "role": "REF",
          "nationality": "Germany"
        }.with_indifferent_access,
        {
          "id": 57532,
          "name": "Frank Willenborg",
          "role": "REF",
          "nationality": "Germany"
        }.with_indifferent_access
      ]
    }.with_indifferent_access
  ]
end
