# frozen_string_literal: true

RSpec.describe Football::Butler::Lineups do
  before do
    stubs_lineups
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_match' do
    context 'success' do
      it 'returns lineup' do
        response = described_class.by_match(id: 2002)

        expect(response).to be_a(Hash)
        expect(response).to include(response_lineups.stringify_keys)
      end
    end

    context 'error' do
      it 'returns lineup' do
        response = described_class.by_match(id: 1)

        expect(response).to be_a(Hash)
        expect(response['message']).to eq("The resource you are looking for does not exist.")
      end
    end
  end
end

def stubs_lineups
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/matches/2002")
    .to_return(status: 200, body: get_mocked_response('lineup.json', :football_data))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/matches/1")
    .to_return(status: 200, body: get_mocked_response('resource_missing.json', :football_data))
end

def response_lineups
  {
    "homeTeam": {
      "id": 678,
      "name": "AFC Ajax",
      "coach": {
        "id": 9584,
        "name": "Erik ten Hag",
        "countryOfBirth": "Netherlands",
        "nationality": "Netherlands"
      }.with_indifferent_access,
      "captain": {
        "id": 7549,
        "name": "Matthijs de Ligt",
        "shirtNumber": 4
      }.with_indifferent_access,
      "lineup": [
        {
          "id": 7544,
          "name": "André Onana",
          "position": "Goalkeeper",
          "shirtNumber": 24
        }.with_indifferent_access,
        {
          "id": 7899,
          "name": "Daley Blind",
          "position": "Defender",
          "shirtNumber": 17
        }.with_indifferent_access,
        {
          "id": 3208,
          "name": "Nicolás Tagliafico",
          "position": "Defender",
          "shirtNumber": 31
        }.with_indifferent_access,
        {
          "id": 7549,
          "name": "Matthijs de Ligt",
          "position": "Defender",
          "shirtNumber": 4
        }.with_indifferent_access,
        {
          "id": 7554,
          "name": "Rasmus Kristensen",
          "position": "Defender",
          "shirtNumber": 2
        }.with_indifferent_access,
        {
          "id": 3707,
          "name": "Hakim Ziyech",
          "position": "Midfielder",
          "shirtNumber": 22
        }.with_indifferent_access,
        {
          "id": 7556,
          "name": "Donny van de Beek",
          "position": "Midfielder",
          "shirtNumber": 6
        }.with_indifferent_access,
        {
          "id": 7560,
          "name": "Carel Eiting",
          "position": "Midfielder",
          "shirtNumber": 15
        }.with_indifferent_access,
        {
          "id": 7559,
          "name": "Frenkie de Jong",
          "position": "Midfielder",
          "shirtNumber": 21
        }.with_indifferent_access,
        {
          "id": 7572,
          "name": "Klaas-Jan Huntelaar",
          "position": "Attacker",
          "shirtNumber": 9
        }.with_indifferent_access,
        {
          "id": 3444,
          "name": "Dušan Tadić",
          "position": "Attacker",
          "shirtNumber": 10
        }.with_indifferent_access
      ],
      "bench": [
        {
          "id": 7546,
          "name": "Kostas Lamprou",
          "position": "Goalkeeper",
          "shirtNumber": 26
        }.with_indifferent_access,
        {
          "id": 7553,
          "name": "Noussair Mazraoui",
          "position": "Defender",
          "shirtNumber": 12
        }.with_indifferent_access,
        {
          "id": 53469,
          "name": "Perr Schuurs",
          "position": "Defender",
          "shirtNumber": 27
        }.with_indifferent_access,
        {
          "id": 3458,
          "name": "Lasse Schöne",
          "position": "Midfielder",
          "shirtNumber": 20
        }.with_indifferent_access,
        {
          "id": 3703,
          "name": "Zakaria Labyad",
          "position": "Midfielder",
          "shirtNumber": 19
        }.with_indifferent_access,
        {
          "id": 7562,
          "name": "Maximilian Wöber",
          "position": "Midfielder",
          "shirtNumber": 5
        }.with_indifferent_access,
        {
          "id": 7564,
          "name": "Dani de Wit",
          "position": "Midfielder",
          "shirtNumber": 30
        }.with_indifferent_access,
        {
          "id": 7574,
          "name": "Kaj Sierhuis",
          "position": "Attacker",
          "shirtNumber": 39
        }.with_indifferent_access,
        {
          "id": 7573,
          "name": "Dennis Johnsen",
          "position": "Attacker",
          "shirtNumber": 41
        }.with_indifferent_access
      ]
    }.with_indifferent_access,
    "awayTeam": {
      "id": 1914,
      "name": "FC Emmen",
      "coach": {
        "id": 9850,
        "name": "Dick Lukkien",
        "countryOfBirth": "Netherlands",
        "nationality": "Netherlands"
      }.with_indifferent_access,
      "captain": {
        "id": 9847,
        "name": "Anco Jansen",
        "shirtNumber": 6
      }.with_indifferent_access,
      "lineup": [
        {
          "id": 9814,
          "name": "Kjell Scherpen",
          "position": "Goalkeeper",
          "shirtNumber": 12
        }.with_indifferent_access,
        {
          "id": 9816,
          "name": "Tim Siekman",
          "position": "Defender",
          "shirtNumber": 3
        }.with_indifferent_access,
        {
          "id": 9824,
          "name": "Glenn Bijl",
          "position": "Defender",
          "shirtNumber": 23
        }.with_indifferent_access,
        {
          "id": 9825,
          "name": "Keziah Veendorp",
          "position": "Defender",
          "shirtNumber": 13
        }.with_indifferent_access,
        {
          "id": 9834,
          "name": "Michael Chacón",
          "position": "Midfielder",
          "shirtNumber": 20
        }.with_indifferent_access,
        {
          "id": 29929,
          "name": "Caner Cavlan",
          "position": "Midfielder",
          "shirtNumber": 22
        }.with_indifferent_access,
        {
          "id": 9340,
          "name": "Nicklas Pedersen",
          "position": "Attacker",
          "shirtNumber": 9
        }.with_indifferent_access,
        {
          "id": 7279,
          "name": "Luciano Slagveer",
          "position": "Attacker",
          "shirtNumber": 17
        }.with_indifferent_access,
        {
          "id": 7732,
          "name": "Wouter Marinus",
          "position": "Attacker",
          "shirtNumber": 7
        }.with_indifferent_access,
        {
          "id": 9847,
          "name": "Anco Jansen",
          "position": "Attacker",
          "shirtNumber": 6
        }.with_indifferent_access,
        {
          "id": 9840,
          "name": "Gersom Klok",
          "position": "Attacker",
          "shirtNumber": 5
        }.with_indifferent_access
      ],
      "bench": [
        {
          "id": 9815,
          "name": "Peter van der Vlag",
          "position": "Goalkeeper",
          "shirtNumber": 1
        }.with_indifferent_access,
        {
          "id": 9813,
          "name": "Dennis Telgenkamp",
          "position": "Goalkeeper",
          "shirtNumber": 26
        }.with_indifferent_access,
        {
          "id": 6094,
          "name": "Easah Suliman",
          "position": "Defender",
          "shirtNumber": 15
        }.with_indifferent_access,
        {
          "id": 9817,
          "name": "Stef Gronsveld",
          "position": "Defender",
          "shirtNumber": 2
        }.with_indifferent_access,
        {
          "id": 9819,
          "name": "Nick Bakker",
          "position": "Defender",
          "shirtNumber": 4
        }.with_indifferent_access,
        {
          "id": 9835,
          "name": "Hilal Ben Moussa",
          "position": "Midfielder",
          "shirtNumber": 8
        }.with_indifferent_access,
        {
          "id": 9829,
          "name": "Henk Bos",
          "position": "Midfielder",
          "shirtNumber": 30
        }.with_indifferent_access,
        {
          "id": 9841,
          "name": "Cas Peters",
          "position": "Attacker",
          "shirtNumber": 11
        }.with_indifferent_access,
        {
          "id": 9633,
          "name": "Jafar Arias",
          "position": "Attacker",
          "shirtNumber": 25
        }.with_indifferent_access
      ]
    }.with_indifferent_access
  }.with_indifferent_access
end
