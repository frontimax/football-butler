# frozen_string_literal: true

RSpec.describe Football::Butler::Teams do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_APIFOOTBALL,
      api_name: :apifootball_com
    )

    stubs_teams_apifootball
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_id' do
    it 'returns one team' do
      response = described_class.by_id(id: 2611)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_team_apifootball)
    end
  end

  describe 'when by_competition' do
    it 'returns all teams of a competition' do
      response = described_class.by_competition(id: 149)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_team_apifootball)
    end
  end

  describe 'when by_competition' do
    it 'returns all teams of a competition result all' do
      response = described_class.by_competition(id: 149, result: :default)

      expect(response.parsed_response).to be_a(Array)
      expect(response).to match_array(response_team_apifootball)
    end
  end

  describe 'when by_competition_and_year' do
    it 'returns all teams of a competition by a season starting year' do
      response = described_class.by_competition_and_year(id: 2002, year: 2019)

      expect(response).to be_a(Hash)
      expect(response['message']).to eq("Method 'by_competition_and_year' is not supported for the endpoint 'Teams' by this API: apifootball_com")
    end
  end
end

def stubs_teams_apifootball
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}APIkey=my_dummy_token&action=get_teams&team_id=2611")
    .to_return(status: 200, body: get_mocked_response('team.json', :apifootball))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}APIkey=my_dummy_token&action=get_teams&league_id=149")
    .to_return(status: 200, body: get_mocked_response('team.json', :apifootball))
end

def response_team_apifootball
  [
    {
      "team_key": "2611",
      "team_name": "Leicester",
      "team_badge": "https://apiv2.apifootball.com/badges/2611_leicester.png",
      "players": [
        {
          "player_key": 140150332,
          "player_name": "Schmeichel Kasper",
          "player_number": "1",
          "player_country": "Denmark",
          "player_type": "Goalkeepers",
          "player_age": "34",
          "player_match_played": "32",
          "player_goals": "0",
          "player_yellow_cards": "0",
          "player_red_cards": "0"
        }.with_indifferent_access,
        {
          "player_key": 887788809,
          "player_name": "Castagne Timothy",
          "player_number": "27",
          "player_country": "Belgium",
          "player_type": "Defenders",
          "player_age": "25",
          "player_match_played": "21",
          "player_goals": "1",
          "player_yellow_cards": "1",
          "player_red_cards": "0"
        }.with_indifferent_access,
        {
          "player_key": 995156270,
          "player_name": "Evans Jonny",
          "player_number": "6",
          "player_country": "Northern Ireland",
          "player_type": "Defenders",
          "player_age": "33",
          "player_match_played": "26",
          "player_goals": "1",
          "player_yellow_cards": "7",
          "player_red_cards": "0"
        }.with_indifferent_access,
        {
          "player_key": 2664328922,
          "player_name": "Fofana Wesley",
          "player_number": "3",
          "player_country": "France",
          "player_type": "Defenders",
          "player_age": "20",
          "player_match_played": "22",
          "player_goals": "0",
          "player_yellow_cards": "6",
          "player_red_cards": "0"
        }.with_indifferent_access,
        {
          "player_key": 3633688113,
          "player_name": "Fuchs Christian",
          "player_number": "28",
          "player_country": "Austria",
          "player_type": "Defenders",
          "player_age": "35",
          "player_match_played": "9",
          "player_goals": "0",
          "player_yellow_cards": "4",
          "player_red_cards": "0"
        }.with_indifferent_access,
        {
          "player_key": 3964268980,
          "player_name": "Justin James",
          "player_number": "2",
          "player_country": "England",
          "player_type": "Defenders",
          "player_age": "23",
          "player_match_played": "23",
          "player_goals": "2",
          "player_yellow_cards": "4",
          "player_red_cards": "0"
        }.with_indifferent_access,
        {
          "player_key": 2158513520,
          "player_name": "Morgan Wes",
          "player_number": "5",
          "player_country": "Jamaica",
          "player_type": "Defenders",
          "player_age": "37",
          "player_match_played": "3",
          "player_goals": "0",
          "player_yellow_cards": "0",
          "player_red_cards": "0"
        }.with_indifferent_access,
        {
          "player_key": 1441661454,
          "player_name": "Pereira Ricardo",
          "player_number": "21",
          "player_country": "Portugal",
          "player_type": "Defenders",
          "player_age": "27",
          "player_match_played": "12",
          "player_goals": "0",
          "player_yellow_cards": "2",
          "player_red_cards": "0"
        }.with_indifferent_access,
        {
          "player_key": 1205162722,
          "player_name": "Soyuncu Caglar",
          "player_number": "4",
          "player_country": "Turkey",
          "player_type": "Defenders",
          "player_age": "24",
          "player_match_played": "17",
          "player_goals": "0",
          "player_yellow_cards": "2",
          "player_red_cards": "0"
        }.with_indifferent_access,
        {
          "player_key": 3938939561,
          "player_name": "Albrighton Marc",
          "player_number": "11",
          "player_country": "England",
          "player_type": "Midfielders",
          "player_age": "31",
          "player_match_played": "25",
          "player_goals": "0",
          "player_yellow_cards": "2",
          "player_red_cards": "0"
        }.with_indifferent_access,
        {
          "player_key": 484652951,
          "player_name": "Amartey Daniel",
          "player_number": "18",
          "player_country": "Ghana",
          "player_type": "Midfielders",
          "player_age": "26",
          "player_match_played": "12",
          "player_goals": "1",
          "player_yellow_cards": "2",
          "player_red_cards": "0"
        }.with_indifferent_access,
        {
          "player_key": 3348049933,
          "player_name": "Barnes Harvey",
          "player_number": "15",
          "player_country": "England",
          "player_type": "Midfielders",
          "player_age": "23",
          "player_match_played": "25",
          "player_goals": "9",
          "player_yellow_cards": "0",
          "player_red_cards": "0"
        }.with_indifferent_access,
        {
          "player_key": 2491690726,
          "player_name": "Choudhury Hamza",
          "player_number": "20",
          "player_country": "England",
          "player_type": "Midfielders",
          "player_age": "23",
          "player_match_played": "9",
          "player_goals": "0",
          "player_yellow_cards": "1",
          "player_red_cards": "0"
        }.with_indifferent_access,
        {
          "player_key": 1121254810,
          "player_name": "Leshabela Thakgalo Khanya",
          "player_number": "8",
          "player_country": "South Africa",
          "player_type": "Midfielders",
          "player_age": "21",
          "player_match_played": "1",
          "player_goals": "0",
          "player_yellow_cards": "0",
          "player_red_cards": "0"
        }.with_indifferent_access,
        {
          "player_key": 2761090637,
          "player_name": "Maddison James",
          "player_number": "10",
          "player_country": "England",
          "player_type": "Midfielders",
          "player_age": "24",
          "player_match_played": "25",
          "player_goals": "8",
          "player_yellow_cards": "4",
          "player_red_cards": "0"
        }.with_indifferent_access,
        {
          "player_key": 2016135181,
          "player_name": "Mendy Nampalys",
          "player_number": "24",
          "player_country": "Senegal",
          "player_type": "Midfielders",
          "player_age": "28",
          "player_match_played": "21",
          "player_goals": "0",
          "player_yellow_cards": "5",
          "player_red_cards": "0"
        }.with_indifferent_access,
        {
          "player_key": 1202243172,
          "player_name": "Ndidi Wilfred",
          "player_number": "25",
          "player_country": "Nigeria",
          "player_type": "Midfielders",
          "player_age": "24",
          "player_match_played": "20",
          "player_goals": "1",
          "player_yellow_cards": "5",
          "player_red_cards": "0"
        }.with_indifferent_access,
        {
          "player_key": 2720722697,
          "player_name": "Praet Dennis",
          "player_number": "26",
          "player_country": "Belgium",
          "player_type": "Midfielders",
          "player_age": "26",
          "player_match_played": "15",
          "player_goals": "1",
          "player_yellow_cards": "0",
          "player_red_cards": "0"
        }.with_indifferent_access,
        {
          "player_key": 3402380881,
          "player_name": "Tavares Sidnei",
          "player_number": "10",
          "player_country": "Portugal",
          "player_type": "Midfielders",
          "player_age": "19",
          "player_match_played": "2",
          "player_goals": "0",
          "player_yellow_cards": "0",
          "player_red_cards": "0"
        }.with_indifferent_access,
        {
          "player_key": 1222574434,
          "player_name": "Thomas Luke",
          "player_number": "33",
          "player_country": "England",
          "player_type": "Midfielders",
          "player_age": "19",
          "player_match_played": "8",
          "player_goals": "0",
          "player_yellow_cards": "2",
          "player_red_cards": "0"
        }.with_indifferent_access,
        {
          "player_key": 3471809973,
          "player_name": "Tielemans Youri",
          "player_number": "8",
          "player_country": "Belgium",
          "player_type": "Midfielders",
          "player_age": "23",
          "player_match_played": "32",
          "player_goals": "6",
          "player_yellow_cards": "6",
          "player_red_cards": "0"
        }.with_indifferent_access,
        {
          "player_key": 541497037,
          "player_name": "Under Cengiz",
          "player_number": "19",
          "player_country": "Turkey",
          "player_type": "Midfielders",
          "player_age": "23",
          "player_match_played": "9",
          "player_goals": "0",
          "player_yellow_cards": "0",
          "player_red_cards": "0"
        }.with_indifferent_access,
        {
          "player_key": 1089624490,
          "player_name": "Iheanacho Kelechi",
          "player_number": "14",
          "player_country": "Nigeria",
          "player_type": "Forwards",
          "player_age": "24",
          "player_match_played": "19",
          "player_goals": "9",
          "player_yellow_cards": "0",
          "player_red_cards": "0"
        }.with_indifferent_access,
        {
          "player_key": 2147838428,
          "player_name": "Perez Ayoze",
          "player_number": "17",
          "player_country": "Spain",
          "player_type": "Forwards",
          "player_age": "27",
          "player_match_played": "19",
          "player_goals": "2",
          "player_yellow_cards": "1",
          "player_red_cards": "0"
        }.with_indifferent_access,
        {
          "player_key": 1991385181,
          "player_name": "Vardy Jamie",
          "player_number": "9",
          "player_country": "England",
          "player_type": "Forwards",
          "player_age": "34",
          "player_match_played": "28",
          "player_goals": "13",
          "player_yellow_cards": "1",
          "player_red_cards": "0"
        }.with_indifferent_access
      ],
      "coaches": [
        {
          "coach_name": "Rodgers Brendan",
          "coach_country": "Northern Ireland",
          "coach_age": "48"
        }.with_indifferent_access
      ]
    }.with_indifferent_access
  ]
end