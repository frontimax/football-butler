# frozen_string_literal: true

RSpec.describe Football::Butler::Lineups do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_APIFOOTBALL,
      api_name: :apifootball_com
    )

    stubs_lineups_apifootball
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_id' do
    it 'returns one lineup' do
      response = described_class.by_match(id: 86392)

      expect(response).to be_a(Hash)
      expect(response).to include(response_lineup_apifootball.stringify_keys)
    end
  end
end

def stubs_lineups_apifootball
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}APIkey=my_dummy_token&action=get_lineups&match_id=86392")
    .to_return(status: 200, body: get_mocked_response('lineup.json', :apifootball))
end

def response_lineup_apifootball
  {
    "86392": {
      "lineup": {
        "home": {
          "starting_lineups": [
            {
              "lineup_player": "Fernando Pacheco",
              "lineup_number": "1",
              "lineup_position": "1",
              "player_key": "2697551827"
            }.with_indifferent_access,
            {
              "lineup_player": "Florian Lejeune",
              "lineup_number": "22",
              "lineup_position": "4",
              "player_key": "676474805"
            }.with_indifferent_access,
            {
              "lineup_player": "Joselu",
              "lineup_number": "9",
              "lineup_position": "11",
              "player_key": "1661095253"
            }.with_indifferent_access,
            {
              "lineup_player": "Lucas Pérez",
              "lineup_number": "7",
              "lineup_position": "10",
              "player_key": "1429508823"
            }.with_indifferent_access,
            {
              "lineup_player": "Luis Rioja",
              "lineup_number": "11",
              "lineup_position": "9",
              "player_key": "463764509"
            }.with_indifferent_access,
            {
              "lineup_player": "Martín Aguirregabiria",
              "lineup_number": "21",
              "lineup_position": "2",
              "player_key": "4131066306"
            }.with_indifferent_access,
            {
              "lineup_player": "Pere Pons",
              "lineup_number": "20",
              "lineup_position": "6",
              "player_key": "2119225283"
            }.with_indifferent_access,
            {
              "lineup_player": "Rodrigo Battaglia",
              "lineup_number": "6",
              "lineup_position": "7",
              "player_key": "3155098122"
            }.with_indifferent_access,
            {
              "lineup_player": "Rubén Duarte",
              "lineup_number": "3",
              "lineup_position": "5",
              "player_key": "1573833457"
            }.with_indifferent_access,
            {
              "lineup_player": "Tomás Pina",
              "lineup_number": "8",
              "lineup_position": "8",
              "player_key": "161826300"
            }.with_indifferent_access,
            {
              "lineup_player": "Víctor Laguardia",
              "lineup_number": "5",
              "lineup_position": "3",
              "player_key": "3105492768"
            }.with_indifferent_access
          ],
          "substitutes": [
            {
              "lineup_player": "Abdallahi Mahmoud",
              "lineup_number": "30",
              "lineup_position": "0",
              "player_key": "3323219436"
            }.with_indifferent_access,
            {
              "lineup_player": "Alberto Rodríguez",
              "lineup_number": "2",
              "lineup_position": "0",
              "player_key": "3090376076"
            }.with_indifferent_access,
            {
              "lineup_player": "Antonio Sivera",
              "lineup_number": "13",
              "lineup_position": "0",
              "player_key": "110913762"
            }.with_indifferent_access,
            {
              "lineup_player": "Borja Sainz",
              "lineup_number": "29",
              "lineup_position": "0",
              "player_key": "1097591054"
            }.with_indifferent_access,
            {
              "lineup_player": "Deyverson",
              "lineup_number": "14",
              "lineup_position": "0",
              "player_key": "1521934290"
            }.with_indifferent_access,
            {
              "lineup_player": "Eneko Ortiz",
              "lineup_number": "41",
              "lineup_position": "0",
              "player_key": "4177001466"
            }.with_indifferent_access,
            {
              "lineup_player": "Facundo Pellistri",
              "lineup_number": "37",
              "lineup_position": "0",
              "player_key": "4202100780"
            }.with_indifferent_access,
            {
              "lineup_player": "Hugo Pérez",
              "lineup_number": "38",
              "lineup_position": "0",
              "player_key": "1183957814"
            }.with_indifferent_access,
            {
              "lineup_player": "John Guidetti",
              "lineup_number": "10",
              "lineup_position": "0",
              "player_key": "2970293474"
            }.with_indifferent_access,
            {
              "lineup_player": "Manu García",
              "lineup_number": "19",
              "lineup_position": "0",
              "player_key": "589854713"
            }.with_indifferent_access,
            {
              "lineup_player": "Robert Vallribera",
              "lineup_number": "40",
              "lineup_position": "0",
              "player_key": "491007440"
            }.with_indifferent_access,
            {
              "lineup_player": "Ximo Navarro",
              "lineup_number": "23",
              "lineup_position": "0",
              "player_key": "1695303182"
            }.with_indifferent_access
          ],
          "coach": [
            {
              "lineup_player": "Javi Calleja",
              "lineup_number": "",
              "lineup_position": "",
              "player_key": "2090999962"
            }.with_indifferent_access
          ],
          "missing_players": []
        }.with_indifferent_access,
        "away": {
          "starting_lineups": [
            {
              "lineup_player": "Aarón Escandell",
              "lineup_number": "13",
              "lineup_position": "1",
              "player_key": "4163952067"
            }.with_indifferent_access,
            {
              "lineup_player": "Adrián Marín",
              "lineup_number": "18",
              "lineup_position": "10",
              "player_key": "2956156479"
            }.with_indifferent_access,
            {
              "lineup_player": "Alberto Soro",
              "lineup_number": "26",
              "lineup_position": "8",
              "player_key": "4153333428"
            }.with_indifferent_access,
            {
              "lineup_player": "Dimitri Foulquier",
              "lineup_number": "2",
              "lineup_position": "2",
              "player_key": "44397742"
            }.with_indifferent_access,
            {
              "lineup_player": "Domingos Duarte",
              "lineup_number": "22",
              "lineup_position": "3",
              "player_key": "3230775683"
            }.with_indifferent_access,
            {
              "lineup_player": "Jorge Molina",
              "lineup_number": "23",
              "lineup_position": "11",
              "player_key": "1105239340"
            }.with_indifferent_access,
            {
              "lineup_player": "Luis Javier Suárez",
              "lineup_number": "7",
              "lineup_position": "9",
              "player_key": "2516254031"
            }.with_indifferent_access,
            {
              "lineup_player": "Maxime Gonalons",
              "lineup_number": "4",
              "lineup_position": "7",
              "player_key": "700138100"
            }.with_indifferent_access,
            {
              "lineup_player": "Nehuén Pérez",
              "lineup_number": "3",
              "lineup_position": "4",
              "player_key": "449274667"
            }.with_indifferent_access,
            {
              "lineup_player": "Quini",
              "lineup_number": "17",
              "lineup_position": "5",
              "player_key": "4109720946"
            }.with_indifferent_access,
            {
              "lineup_player": "Yan Eteki",
              "lineup_number": "8",
              "lineup_position": "6",
              "player_key": "1745267976"
            }.with_indifferent_access
          ],
          "substitutes": [
            {
              "lineup_player": "Antonio Puertas",
              "lineup_number": "10",
              "lineup_position": "0",
              "player_key": "1306175954"
            }.with_indifferent_access,
            {
              "lineup_player": "Arnau Fàbrega",
              "lineup_number": "31",
              "lineup_position": "0",
              "player_key": "3737665595"
            }.with_indifferent_access,
            {
              "lineup_player": "Darwin Machís",
              "lineup_number": "11",
              "lineup_position": "0",
              "player_key": "583545632"
            }.with_indifferent_access,
            {
              "lineup_player": "Domingos Quina",
              "lineup_number": "12",
              "lineup_position": "0",
              "player_key": "3653110656"
            }.with_indifferent_access,
            {
              "lineup_player": "Fede Vico",
              "lineup_number": "14",
              "lineup_position": "0",
              "player_key": "627061988"
            }.with_indifferent_access,
            {
              "lineup_player": "Germán Sánchez",
              "lineup_number": "6",
              "lineup_position": "0",
              "player_key": "3297502370"
            }.with_indifferent_access,
            {
              "lineup_player": "Pepe Sánchez",
              "lineup_number": "28",
              "lineup_position": "0",
              "player_key": "1200400143"
            }.with_indifferent_access,
            {
              "lineup_player": "Rui Silva",
              "lineup_number": "1",
              "lineup_position": "0",
              "player_key": "3351327898"
            }.with_indifferent_access
          ],
          "coach": [
            {
              "lineup_player": "Diego Martínez",
              "lineup_number": "",
              "lineup_position": "",
              "player_key": "46479144"
            }.with_indifferent_access
          ],
          "missing_players": []
        }.with_indifferent_access
      }.with_indifferent_access
    }.with_indifferent_access
  }.with_indifferent_access
end
