# frozen_string_literal: true

RSpec.describe Football::Butler::HeadToHead do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_APIFOOTBALL,
      api_name: :apifootball_com
    )

    stubs_head_to_head_apifootball
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_id' do
    it 'returns one odd' do
      response = described_class.by_teams(team_id: 7275, second_team_id: 151)

      expect(response).to be_a(Hash)
      expect(response).to include(response_head_to_head_apifootball.stringify_keys)
    end
  end
end

def stubs_head_to_head_apifootball
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}APIkey=my_dummy_token&action=get_H2H&firstTeamId=7275&secondTeamId=151")
    .to_return(status: 200, body: get_mocked_response('head_to_head.json', :apifootball))
end

def response_head_to_head_apifootball
  {
    "firstTeam_VS_secondTeam": [],
    "firstTeam_lastResults": [
      {
        "match_id": "86392",
        "country_id": "6",
        "country_name": "Spain",
        "league_id": "302",
        "league_name": "La Liga",
        "match_date": "2021-05-16",
        "match_status": "Finished",
        "match_time": "18:30",
        "match_hometeam_id": "7275",
        "match_hometeam_name": "Deportivo Alavés",
        "match_hometeam_score": "4",
        "match_awayteam_id": "151",
        "match_awayteam_name": "Granada",
        "match_awayteam_score": "2",
        "match_hometeam_halftime_score": "2",
        "match_awayteam_halftime_score": "1",
        "match_live": "0",
        "team_home_badge": "https://apiv3.apifootball.com/badges/7275_deportivo-alaves.jpg",
        "team_away_badge": "https://apiv3.apifootball.com/badges/151_granada.jpg",
        "league_logo": "https://apiv3.apifootball.com/badges/logo_leagues/302_la-liga.png",
        "country_logo": "https://apiv3.apifootball.com/badges/logo_country/6_spain.png"
      }.with_indifferent_access,
      {
        "match_id": "137228",
        "country_id": "6",
        "country_name": "Spain",
        "league_id": "302",
        "league_name": "La Liga",
        "match_date": "2021-05-11",
        "match_status": "Finished",
        "match_time": "20:00",
        "match_hometeam_id": "7274",
        "match_hometeam_name": "Elche",
        "match_hometeam_score": "0",
        "match_awayteam_id": "7275",
        "match_awayteam_name": "Deportivo Alavés",
        "match_awayteam_score": "2",
        "match_hometeam_halftime_score": "0",
        "match_awayteam_halftime_score": "1",
        "match_live": "0",
        "team_home_badge": "https://apiv3.apifootball.com/badges/7274_elche.jpg",
        "team_away_badge": "https://apiv3.apifootball.com/badges/7275_deportivo-alaves.jpg",
        "league_logo": "https://apiv3.apifootball.com/badges/logo_leagues/302_la-liga.png",
        "country_logo": "https://apiv3.apifootball.com/badges/logo_country/6_spain.png"
      }.with_indifferent_access
    ],
    "secondTeam_lastResults": [
      {
        "match_id": "86392",
        "country_id": "6",
        "country_name": "Spain",
        "league_id": "302",
        "league_name": "La Liga",
        "match_date": "2021-05-16",
        "match_status": "Finished",
        "match_time": "18:30",
        "match_hometeam_id": "7275",
        "match_hometeam_name": "Deportivo Alavés",
        "match_hometeam_score": "4",
        "match_awayteam_id": "151",
        "match_awayteam_name": "Granada",
        "match_awayteam_score": "2",
        "match_hometeam_halftime_score": "2",
        "match_awayteam_halftime_score": "1",
        "match_live": "0",
        "team_home_badge": "https://apiv3.apifootball.com/badges/7275_deportivo-alaves.jpg",
        "team_away_badge": "https://apiv3.apifootball.com/badges/151_granada.jpg",
        "league_logo": "https://apiv3.apifootball.com/badges/logo_leagues/302_la-liga.png",
        "country_logo": "https://apiv3.apifootball.com/badges/logo_country/6_spain.png"
      }.with_indifferent_access,
      {
        "match_id": "138136",
        "country_id": "6",
        "country_name": "Spain",
        "league_id": "302",
        "league_name": "La Liga",
        "match_date": "2021-05-13",
        "match_status": "Finished",
        "match_time": "22:00",
        "match_hometeam_id": "151",
        "match_hometeam_name": "Granada",
        "match_hometeam_score": "1",
        "match_awayteam_id": "76",
        "match_awayteam_name": "Real Madrid",
        "match_awayteam_score": "4",
        "match_hometeam_halftime_score": "0",
        "match_awayteam_halftime_score": "2",
        "match_live": "0",
        "team_home_badge": "https://apiv3.apifootball.com/badges/151_granada.jpg",
        "team_away_badge": "https://apiv3.apifootball.com/badges/76_real-madrid.jpg",
        "league_logo": "https://apiv3.apifootball.com/badges/logo_leagues/302_la-liga.png",
        "country_logo": "https://apiv3.apifootball.com/badges/logo_country/6_spain.png"
      }.with_indifferent_access
    ]
  }.with_indifferent_access
end
