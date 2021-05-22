# frozen_string_literal: true

RSpec.describe Football::Butler::Events do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_APIFOOTBALL,
      api_name: :apifootball_com
    )
    
    stubs_matches_apifootball
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_id' do
    it 'returns one match' do
      response = described_class.by_id(id: 205430)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_match_apifootball)
    end
  end

  describe 'when all' do
    it 'returns parameters missing' do
      response = described_class.all

      expect(response).to be_a(Hash)
      expect(response['message']).to eq('Required parameters missing')
    end

    it 'returns parameters missing with param :default' do
      response = described_class.all(result: :default)

      expect(response).to be_a(Hash)
      expect(response['message']).to eq('Required parameters missing')
    end

    it 'returns match by match_id' do
      response = described_class.all(filters: { match_id: 205430 })

      expect(response).to be_a(Array)
      expect(response).to match_array(response_match_apifootball)
    end

    it 'returns returns match by match_id result param :default' do
      response = described_class.all(result: :default)

      expect(response).to be_a(Hash)
      expect(response['message']).to eq('Required parameters missing')
    end
  end

  describe 'when by_competition' do
    it 'returns all matches of competition' do
      response = described_class.by_competition(id: 149)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_match_apifootball)
    end
  end

  describe 'when by_competition_and_year' do
    it 'returns all matches of competition and season year' do
      response = described_class.by_competition_and_year(id: 149, year: 2020)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_match_apifootball)
    end
  end

  describe 'when by_team' do
    it 'returns all matches of a team' do
      response = described_class.by_team(id: 148)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_match_apifootball)
    end
  end
end

def stubs_matches_apifootball
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}APIkey=my_dummy_token&action=get_events&match_id=205430")
    .to_return(status: 200, body: get_mocked_response('match.json', :apifootball))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}APIkey=my_dummy_token&action=get_events")
    .to_return(status: 200, body: get_mocked_response('matches_missing_param.json', :apifootball))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}APIkey=my_dummy_token&action=get_events&league_id=149")
    .to_return(status: 200, body: get_mocked_response('matches.json', :apifootball))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}APIkey=my_dummy_token&action=get_events&from=2020-01-01&to=2020-12-31")
    .to_return(status: 200, body: get_mocked_response('matches.json', :apifootball))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}APIkey=my_dummy_token&action=get_events&team_id=148")
    .to_return(status: 200, body: get_mocked_response('matches.json', :apifootball))

  #stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/matches")
  #   .to_return(status: 200, body: get_mocked_response('matches.json', :apifootball))
  #
  # stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/competitions/2002/matches")
  #   .to_return(status: 200, body: get_mocked_response('matches_more.json', :apifootball))
  #
  # stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/competitions/2002/matches?season=2020")
  #   .to_return(status: 200, body: get_mocked_response('matches_more.json', :apifootball))
  #
  # stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/competitions/2002/matches?matchday=1")
  #   .to_return(status: 200, body: get_mocked_response('matches_more.json', :apifootball))
  #
  # stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/teams/2002/matches")
  #   .to_return(status: 200, body: get_mocked_response('matches_more.json', :apifootball))
  #
  # stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/teams/2002/matches?status=FINISHED")
  #   .to_return(status: 200, body: get_mocked_response('matches_more.json', :apifootball))
  #
  # stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/teams/2002/matches?status=SCHEDULED")
  #   .to_return(status: 200, body: get_mocked_response('matches_more.json', :apifootball))
end

def response_missing
  {
    message: 'The resource you are looking for does not exist.'
  }.with_indifferent_access
end

def response_match_apifootball
  [
    {
      "match_id": "205430",
      "country_id": "41",
      "country_name": "England",
      "league_id": "149",
      "league_name": "Championship",
      "match_date": "2019-04-27",
      "match_status": "Finished",
      "match_time": "14:30",
      "match_hometeam_id": "2638",
      "match_hometeam_name": "Millwall",
      "match_hometeam_score": "0",
      "match_awayteam_name": "Stoke",
      "match_awayteam_id": "2624",
      "match_awayteam_score": "0",
      "match_hometeam_halftime_score": "0",
      "match_awayteam_halftime_score": "0",
      "match_hometeam_extra_score": "",
      "match_awayteam_extra_score": "",
      "match_hometeam_penalty_score": "",
      "match_awayteam_penalty_score": "",
      "match_hometeam_ft_score": "",
      "match_awayteam_ft_score": "",
      "match_hometeam_system": "4 - 1 - 4 - 1",
      "match_awayteam_system": "3 - 4 - 3",
      "match_live": "0",
      "match_round": "Round 45",
      "match_stadium": "",
      "match_referee": "",
      "team_home_badge": "https://apiv2.apifootball.com/badges/2638_millwall.png",
      "team_away_badge": "https://apiv2.apifootball.com/badges/2624_stoke-city.png",
      "league_logo": "https://apiv2.apifootball.com/badges/logo_leagues/149_championship.png",
      "country_logo": "https://apiv2.apifootball.com/badges/logo_country/41_england.png",
      "goalscorer": [],
      "cards": [
        {
          "time": "74",
          "home_fault": "",
          "card": "yellow card",
          "away_fault": "Shawcross R.",
          "info": ""
        }.with_indifferent_access
      ],
      "substitutions": {
        "home": [
          {
            "time": "66",
            "substitution": "Marshall B. | Morison S."
          }.with_indifferent_access
        ],
        "away": [
          {
            "time": "76",
            "substitution": "Ince T. | Vokes S."
          }.with_indifferent_access
        ]
      }.with_indifferent_access,
      "lineup": {
        "home": {
          "starting_lineups": [
            {
              "lineup_player": "Cooper J.",
              "lineup_number": "5",
              "lineup_position": "4",
              "player_key": "183782679"
            }.with_indifferent_access
          ],
          "coach": [
            {
              "lineup_player": "Jones N.",
              "lineup_number": "-1",
              "lineup_position": "",
              "player_key": "2874574677"
            }.with_indifferent_access
          ],
          "missing_players": []
        }.with_indifferent_access
      }.with_indifferent_access,
      "statistics": [
        {
          "type": "Ball Possession",
          "home": "37%",
          "away": "63%"
        }.with_indifferent_access
      ]
    }.with_indifferent_access
  ]
end
