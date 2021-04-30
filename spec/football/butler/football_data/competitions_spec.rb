# frozen_string_literal: true

RSpec.describe Football::Butler::Competitions do
  before do
    stubs_competitions
  end

  describe 'when by_id' do
    it 'returns one competition' do
      response = described_class.by_id(id: 2002)

      expect(response).to be_a(HTTParty::Response)
      expect(response.parsed_response).to be_a(Hash)
      expect(response.parsed_response).to include(response_competition.stringify_keys)
    end
  end

  describe 'when all' do
    it 'returns all competitions' do
      response = described_class.all

      expect(response).to be_a(Array)
      expect(response).to match_array(response_competitions)
    end

    it 'returns all competitions with result param :default' do
      response = described_class.all(result: :default)

      expect(response).to be_a(HTTParty::Response)
      expect(response.parsed_response).to be_a(Hash)
      expect(response.parsed_response).to include(response_competitions_all.stringify_keys)
    end
  end

  describe 'when by_plan' do
    it 'returns all competitions TIER_ONE' do
      response = described_class.by_plan(plan: 'TIER_ONE')

      expect(response).to be_a(Array)
      expect(response).to match_array(response_competitions_filter_plan)
    end
  end

  describe 'when by_areas' do
    it 'returns all competitions two areas' do
      response = described_class.by_areas(ids: [2088, 2081])

      expect(response).to be_a(Array)
      expect(response).to match_array(response_competitions_filter_areas)
    end
  end

  describe 'when current_match_day' do
    it 'returns current matchday of bundesliga' do
      response = described_class.current_match_day(id: 2002)
      expect(response).to eq(27)
    end

    it 'returns nothing' do
      response = described_class.current_match_day(id: 9999)
      expect(response.with_indifferent_access).to include(response_missing.stringify_keys)
    end
  end

  describe 'when seasons' do
    it 'returns all seasons of bundesliga' do
      response = described_class.seasons(id: 2001)
      expect(response).to match_array(response_seasons)
    end

    it 'returns nothing' do
      response = described_class.seasons(id: 9999)
      expect(response.with_indifferent_access).to include(response_missing.stringify_keys)
    end
  end
end

def stubs_competitions
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/competitions/2002")
    .to_return(status: 200, body: get_mocked_response('competition.json', :football_data))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/competitions/9999")
    .to_return(status: 200, body: get_mocked_response('resource_missing.json', :football_data))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/competitions")
    .to_return(status: 200, body: get_mocked_response('competitions.json', :football_data))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/competitions/2001")
    .to_return(status: 200, body: get_mocked_response('seasons.json', :football_data))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/competitions?plan=TIER_ONE")
    .to_return(status: 200, body: get_mocked_response('competitions_filter_plan.json', :football_data))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/competitions?areas=2088,2081")
    .to_return(status: 200, body: get_mocked_response('competitions_filter_areas.json', :football_data))
end

def response_missing
  {
    message: 'The resource you are looking for does not exist.'
  }.with_indifferent_access
end

def response_competition
  {
    "id": 2002,
    "area": {
      "id": 2088,
      "name": "Germany"
    }.with_indifferent_access,
    "name": "Bundesliga",
    "code": "BL1",
    "emblemUrl": "null",
    "plan": "TIER_ONE",
    "currentSeason": {
      "id": 599,
      "startDate": "2020-09-18",
      "endDate": "2021-05-15",
      "currentMatchday": 27,
      "winner": "null"
    }.with_indifferent_access,
    "seasons": [
      {
        "id": 599,
        "startDate": "2020-09-18",
        "endDate": "2021-05-15",
        "currentMatchday": 27,
        "winner": "null"
      }.with_indifferent_access,
      {
        "id": 474,
        "startDate": "2019-08-16",
        "endDate": "2020-06-27",
        "currentMatchday": 34,
        "winner": {
          "id": 5,
          "name": "FC Bayern München",
          "shortName": "Bayern M",
          "tla": "FCB",
          "crestUrl": "https://crests.football-data.org/5.svg"
        }
      }.with_indifferent_access,
      {
        "id": 155,
        "startDate": "2018-08-24",
        "endDate": "2019-05-18",
        "currentMatchday": 34,
        "winner": {
          "id": 5,
          "name": "FC Bayern München",
          "shortName": "Bayern M",
          "tla": "FCB",
          "crestUrl": "https://crests.football-data.org/5.svg"
        }
      }.with_indifferent_access
    ],
    "lastUpdated": "2021-03-22T01:20:06Z"
  }
end

def response_competitions_all
  {
    "count": 152,
    "filters": {}.with_indifferent_access,
    "competitions": [
      {
        "id": 2006,
        "area": {
          "id": 2001,
          "name": "Africa",
          "countryCode": "AFR",
          "ensignUrl": "null"
        }.with_indifferent_access,
        "name": "WC Qualification",
        "code": "null",
        "emblemUrl": "null",
        "plan": "TIER_FOUR",
        "currentSeason": {
          "id": 555,
          "startDate": "2019-09-04",
          "endDate": "2021-11-16",
          "currentMatchday": "null",
          "winner": "null"
        }.with_indifferent_access,
        "numberOfAvailableSeasons": 2,
        "lastUpdated": "2018-06-04T23:54:04Z"
      }.with_indifferent_access,
      {
        "id": 2023,
        "area": {
          "id": 2011,
          "name": "Argentina",
          "countryCode": "ARG",
          "ensignUrl": "null"
        }.with_indifferent_access,
        "name": "Primera B Nacional",
        "code": "null",
        "emblemUrl": "null",
        "plan": "TIER_FOUR",
        "currentSeason": {
          "id": 716,
          "startDate": "2021-03-13",
          "endDate": "2021-12-26",
          "currentMatchday": 3,
          "winner": "null"
        }.with_indifferent_access,
        "numberOfAvailableSeasons": 5,
        "lastUpdated": "2021-03-27T00:00:06Z"
      }.with_indifferent_access,
      {
        "id": 2026,
        "area": {
          "id": 2015,
          "name": "Australia",
          "countryCode": "AUS",
          "ensignUrl": "null"
        }.with_indifferent_access,
        "name": "FFA Cup",
        "code": "null",
        "emblemUrl": "null",
        "plan": "TIER_FOUR",
        "currentSeason": {
          "id": 592,
          "startDate": "2020-02-19",
          "endDate": "2020-10-28",
          "currentMatchday": "null",
          "winner": "null"
        }.with_indifferent_access,
        "numberOfAvailableSeasons": 3,
        "lastUpdated": "2019-10-23T23:59:22Z"
      }.with_indifferent_access
    ]
  }

end

def response_competitions
  [
    {
      "id": 2006,
      "area": {
        "id": 2001,
        "name": "Africa",
        "countryCode": "AFR",
        "ensignUrl": "null"
      }.with_indifferent_access,
      "name": "WC Qualification",
      "code": "null",
      "emblemUrl": "null",
      "plan": "TIER_FOUR",
      "currentSeason": {
        "id": 555,
        "startDate": "2019-09-04",
        "endDate": "2021-11-16",
        "currentMatchday": "null",
        "winner": "null"
      }.with_indifferent_access,
      "numberOfAvailableSeasons": 2,
      "lastUpdated": "2018-06-04T23:54:04Z"
    }.with_indifferent_access,
    {
      "id": 2023,
      "area": {
        "id": 2011,
        "name": "Argentina",
        "countryCode": "ARG",
        "ensignUrl": "null"
      }.with_indifferent_access,
      "name": "Primera B Nacional",
      "code": "null",
      "emblemUrl": "null",
      "plan": "TIER_FOUR",
      "currentSeason": {
        "id": 716,
        "startDate": "2021-03-13",
        "endDate": "2021-12-26",
        "currentMatchday": 3,
        "winner": "null"
      }.with_indifferent_access,
      "numberOfAvailableSeasons": 5,
      "lastUpdated": "2021-03-27T00:00:06Z"
    }.with_indifferent_access,
    {
      "id": 2026,
      "area": {
        "id": 2015,
        "name": "Australia",
        "countryCode": "AUS",
        "ensignUrl": "null"
      }.with_indifferent_access,
      "name": "FFA Cup",
      "code": "null",
      "emblemUrl": "null",
      "plan": "TIER_FOUR",
      "currentSeason": {
        "id": 592,
        "startDate": "2020-02-19",
        "endDate": "2020-10-28",
        "currentMatchday": "null",
        "winner": "null"
      }.with_indifferent_access,
      "numberOfAvailableSeasons": 3,
      "lastUpdated": "2019-10-23T23:59:22Z"
    }.with_indifferent_access
  ]
end

def response_seasons
  [
    {
      "id": 642,
      "startDate": "2020-08-08",
      "endDate": "2021-05-29",
      "currentMatchday": 6,
      "winner": "null"
    }.with_indifferent_access,
    {
      "id": 495,
      "startDate": "2019-06-25",
      "endDate": "2020-08-23",
      "currentMatchday": 6,
      "winner": "null"
    }.with_indifferent_access,
    {
      "id": 175,
      "startDate": "2018-06-26",
      "endDate": "2019-06-01",
      "currentMatchday": 7,
      "winner": "null"
    }.with_indifferent_access
  ]
end

def response_competitions_filter_plan
  [
    {
      "id": 2013,
      "area": {
        "id": 2032,
        "name": "Brazil",
        "countryCode": "BRA",
        "ensignUrl": "null"
      }.with_indifferent_access,
      "name": "Série A",
      "code": "BSA",
      "emblemUrl": "null",
      "plan": "TIER_ONE",
      "currentSeason": {
        "id": 589,
        "startDate": "2020-08-09",
        "endDate": "2021-02-24",
        "currentMatchday": 37,
        "winner": "null"
      }.with_indifferent_access,
      "numberOfAvailableSeasons": 4,
      "lastUpdated": "2021-02-26T13:16:24Z"
    }.with_indifferent_access,
    {
      "id": 2016,
      "area": {
        "id": 2072,
        "name": "England",
        "countryCode": "ENG",
        "ensignUrl": "https://upload.wikimedia.org/wikipedia/en/a/ae/Flag_of_the_United_Kingdom.svg"
      }.with_indifferent_access,
      "name": "Championship",
      "code": "ELC",
      "emblemUrl": "null",
      "plan": "TIER_ONE",
      "currentSeason": {
        "id": 628,
        "startDate": "2020-09-12",
        "endDate": "2021-08-04",
        "currentMatchday": 39,
        "winner": "null"
      }.with_indifferent_access,
      "numberOfAvailableSeasons": 4,
      "lastUpdated": "2021-04-02T00:00:14Z"
    }.with_indifferent_access,
    {
      "id": 2021,
      "area": {
        "id": 2072,
        "name": "England",
        "countryCode": "ENG",
        "ensignUrl": "https://upload.wikimedia.org/wikipedia/en/a/ae/Flag_of_the_United_Kingdom.svg"
      }.with_indifferent_access,
      "name": "Premier League",
      "code": "PL",
      "emblemUrl": "null",
      "plan": "TIER_ONE",
      "currentSeason": {
        "id": 619,
        "startDate": "2020-09-12",
        "endDate": "2021-05-23",
        "currentMatchday": 30,
        "winner": "null"
      }.with_indifferent_access,
      "numberOfAvailableSeasons": 28,
      "lastUpdated": "2021-04-02T00:00:14Z"
    }.with_indifferent_access
  ]
end

def response_competitions_filter_areas
  [
    {
      "id": 2135,
      "area": {
        "id": 2081,
        "name": "France",
        "countryCode": "FRA",
        "ensignUrl": "https://upload.wikimedia.org/wikipedia/en/c/c3/Flag_of_France.svg"
      }.with_indifferent_access,
      "name": "Coupe de la Ligue",
      "code": "null",
      "emblemUrl": "null",
      "plan": "TIER_FOUR",
      "currentSeason": {
        "id": 522,
        "startDate": "2019-08-13",
        "endDate": "2020-04-04",
        "currentMatchday": "null",
        "winner": "null"
      }.with_indifferent_access,
      "numberOfAvailableSeasons": 3,
      "lastUpdated": "2020-09-10T13:52:55Z"
    }.with_indifferent_access,
    {
      "id": 2142,
      "area": {
        "id": 2081,
        "name": "France",
        "countryCode": "FRA",
        "ensignUrl": "https://upload.wikimedia.org/wikipedia/en/c/c3/Flag_of_France.svg"
      }.with_indifferent_access,
      "name": "Ligue 2",
      "code": "FL2",
      "emblemUrl": "null",
      "plan": "TIER_TWO",
      "currentSeason": {
        "id": 597,
        "startDate": "2020-08-22",
        "endDate": "2021-05-15",
        "currentMatchday": 31,
        "winner": "null"
      }.with_indifferent_access,
      "numberOfAvailableSeasons": 23,
      "lastUpdated": "2021-04-02T00:00:16Z"
    }.with_indifferent_access,
    {
      "id": 2015,
      "area": {
        "id": 2081,
        "name": "France",
        "countryCode": "FRA",
        "ensignUrl": "https://upload.wikimedia.org/wikipedia/en/c/c3/Flag_of_France.svg"
      }.with_indifferent_access,
      "name": "Ligue 1",
      "code": "FL1",
      "emblemUrl": "null",
      "plan": "TIER_ONE",
      "currentSeason": {
        "id": 596,
        "startDate": "2020-08-22",
        "endDate": "2021-05-23",
        "currentMatchday": 31,
        "winner": "null"
      }.with_indifferent_access,
      "numberOfAvailableSeasons": 11,
      "lastUpdated": "2021-04-02T00:00:15Z"
    }.with_indifferent_access
  ]
end
