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
      response = described_class.by_id(id: 18)
      expect(response.parsed_response).to include(response_team.stringify_keys)
    end
  end

  describe 'when by_competition' do
    it 'returns all teams of a competition' do
      response = described_class.by_competition(id: 2002)
      expect(response).to match_array(response_teams)
    end
  end

  describe 'when by_competition' do
    it 'returns all teams of a competition result all' do
      response = described_class.by_competition(id: 2002, result: :default)
      expect(response).to match_array(response_teams_all)
    end
  end

  describe 'when by_competition_and_year' do
    it 'returns all teams of a competition by a season starting year' do
      response = described_class.by_competition_and_year(id: 2002, year: 2019)
      expect(response).to match_array(response_teams_filter_year)
    end
  end
end

def stubs_teams_apifootball
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/teams/18")
    .to_return(status: 200, body: get_mocked_response('team.json', :football_data))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/competitions/2002/teams")
    .to_return(status: 200, body: get_mocked_response('teams.json', :football_data))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/competitions/2002/teams?year=2019")
    .to_return(status: 200, body: get_mocked_response('teams_filter_year.json', :football_data))
end

def response_team
  {
    "id": 18,
    "area": {
      "id": 2088,
      "name": "Germany"
    }.with_indifferent_access,
    "activeCompetitions": [
      {
        "id": 2002,
        "area": {
          "id": 2088,
          "name": "Germany"
        }.with_indifferent_access,
        "name": "Bundesliga",
        "code": "BL1",
        "plan": "TIER_ONE",
        "lastUpdated": "2021-03-22T01:20:06Z"
      }.with_indifferent_access,
      {
        "id": 2011,
        "area": {
          "id": 2088,
          "name": "Germany"
        }.with_indifferent_access,
        "name": "DFB-Pokal",
        "code": "DFB",
        "plan": "TIER_TWO",
        "lastUpdated": "2021-03-04T02:35:04Z"
      }.with_indifferent_access,
      {
        "id": 2001,
        "area": {
          "id": 2077,
          "name": "Europe"
        }.with_indifferent_access,
        "name": "UEFA Champions League",
        "code": "CL",
        "plan": "TIER_ONE",
        "lastUpdated": "2021-03-18T03:00:04Z"
      }
    ],
    "name": "Borussia Mönchengladbach",
    "shortName": "M'gladbach",
    "tla": "BMG",
    "crestUrl": "https://crests.football-data.org/18.svg",
    "address": "Hennes-Weisweiler-Allee 1 Mönchengladbach 41179",
    "phone": "+49 (02161) 92930",
    "website": "http://www.borussia.de",
    "email": "info@borussia.de",
    "founded": 1900,
    "clubColors": "Black / White / Green",
    "venue": "Stadion im Borussia-Park",
    "squad": [
      {
        "id": 3176,
        "name": "Matthias Ginter",
        "position": "Defender",
        "dateOfBirth": "1994-01-19T00:00:00Z",
        "countryOfBirth": "Germany",
        "nationality": "Germany",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 3185,
        "name": "Lars Stindl",
        "position": "Midfielder",
        "dateOfBirth": "1988-08-26T00:00:00Z",
        "countryOfBirth": "Germany",
        "nationality": "Germany",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 3470,
        "name": "Yann Sommer",
        "position": "Goalkeeper",
        "dateOfBirth": "1988-12-17T00:00:00Z",
        "countryOfBirth": "Switzerland",
        "nationality": "Switzerland",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 3473,
        "name": "Michael Lang",
        "position": "Defender",
        "dateOfBirth": "1991-02-08T00:00:00Z",
        "countryOfBirth": "Switzerland",
        "nationality": "Switzerland",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 3475,
        "name": "Nico Elvedi",
        "position": "Defender",
        "dateOfBirth": "1996-09-30T00:00:00Z",
        "countryOfBirth": "Switzerland",
        "nationality": "Switzerland",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 3483,
        "name": "Breel Embolo",
        "position": "Attacker",
        "dateOfBirth": "1997-02-14T00:00:00Z",
        "countryOfBirth": "Cameroon",
        "nationality": "Switzerland",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 6563,
        "name": "Valentino Lazaro",
        "position": "Midfielder",
        "dateOfBirth": "1996-03-24T00:00:00Z",
        "countryOfBirth": "Austria",
        "nationality": "Austria",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 6599,
        "name": "Torben Müsel",
        "position": "Midfielder",
        "dateOfBirth": "1999-07-25T00:00:00Z",
        "countryOfBirth": "Germany",
        "nationality": "Germany",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 6667,
        "name": "Tobias Sippel",
        "position": "Goalkeeper",
        "dateOfBirth": "1988-03-22T00:00:00Z",
        "countryOfBirth": "Germany",
        "nationality": "Germany",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 6669,
        "name": "Oscar Wendt",
        "position": "Defender",
        "dateOfBirth": "1985-10-24T00:00:00Z",
        "countryOfBirth": "Sweden",
        "nationality": "Sweden",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 6670,
        "name": "Tony Jantschke",
        "position": "Defender",
        "dateOfBirth": "1990-04-07T00:00:00Z",
        "countryOfBirth": "Germany",
        "nationality": "Germany",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 6672,
        "name": "Mamadou Doucouré",
        "position": "Defender",
        "dateOfBirth": "1998-05-21T00:00:00Z",
        "countryOfBirth": "Senegal",
        "nationality": "France",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 6678,
        "name": "Louis Beyer",
        "position": "Defender",
        "dateOfBirth": "2000-05-19T00:00:00Z",
        "countryOfBirth": "Germany",
        "nationality": "Germany",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 6679,
        "name": "Ibrahima Traoré",
        "position": "Midfielder",
        "dateOfBirth": "1988-04-21T00:00:00Z",
        "countryOfBirth": "France",
        "nationality": "Guinea",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 6680,
        "name": "Patrick Herrmann",
        "position": "Midfielder",
        "dateOfBirth": "1991-02-12T00:00:00Z",
        "countryOfBirth": "Germany",
        "nationality": "Germany",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 6681,
        "name": "Jonas Hofmann",
        "position": "Midfielder",
        "dateOfBirth": "1992-07-14T00:00:00Z",
        "countryOfBirth": "Germany",
        "nationality": "Germany",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 6682,
        "name": "Christoph Kramer",
        "position": "Midfielder",
        "dateOfBirth": "1991-02-19T00:00:00Z",
        "countryOfBirth": "Germany",
        "nationality": "Germany",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 6687,
        "name": "Denis Zakaria",
        "position": "Midfielder",
        "dateOfBirth": "1996-11-20T00:00:00Z",
        "countryOfBirth": "Switzerland",
        "nationality": "Switzerland",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 6694,
        "name": "Julio Villalba",
        "position": "Attacker",
        "dateOfBirth": "1998-09-11T00:00:00Z",
        "countryOfBirth": "Paraguay",
        "nationality": "Paraguay",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 8443,
        "name": "Alassane Pléa",
        "position": "Attacker",
        "dateOfBirth": "1993-03-10T00:00:00Z",
        "countryOfBirth": "France",
        "nationality": "France",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 8685,
        "name": "Marcus Thuram-Ulien",
        "position": "Attacker",
        "dateOfBirth": "1997-08-06T00:00:00Z",
        "countryOfBirth": "Italy",
        "nationality": "France",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 8805,
        "name": "Ramy Bensebaini",
        "position": "Defender",
        "dateOfBirth": "1995-04-16T00:00:00Z",
        "countryOfBirth": "Algeria",
        "nationality": "Algeria",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 9410,
        "name": "Max Grün",
        "position": "Goalkeeper",
        "dateOfBirth": "1987-04-05T00:00:00Z",
        "countryOfBirth": "Germany",
        "nationality": "Germany",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 9522,
        "name": "Florian Neuhaus",
        "position": "Midfielder",
        "dateOfBirth": "1997-03-16T00:00:00Z",
        "countryOfBirth": "Germany",
        "nationality": "Germany",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 15109,
        "name": "Hannes Wolf",
        "position": "Midfielder",
        "dateOfBirth": "1999-04-16T00:00:00Z",
        "countryOfBirth": "Austria",
        "nationality": "Austria",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 15111,
        "name": "Marco Rose",
        "position": "null",
        "dateOfBirth": "1976-09-11T00:00:00Z",
        "countryOfBirth": "Germany",
        "nationality": "Germany",
        "shirtNumber": "null",
        "role": "COACH"
      }.with_indifferent_access,
      {
        "id": 16338,
        "name": "Stefan Lainer",
        "position": "Defender",
        "dateOfBirth": "1992-08-27T00:00:00Z",
        "countryOfBirth": "Austria",
        "nationality": "Austria",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 82442,
        "name": "Joseph Scally",
        "position": "Defender",
        "dateOfBirth": "2002-12-31T00:00:00Z",
        "countryOfBirth": "United States",
        "nationality": "United States",
        "shirtNumber": 25,
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 97458,
        "name": "Jan Jakob Olschowsky",
        "position": "Goalkeeper",
        "dateOfBirth": "2001-11-18T00:00:00Z",
        "countryOfBirth": "Germany",
        "nationality": "Germany",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 122645,
        "name": "Kaan Kurt",
        "position": "Midfielder",
        "dateOfBirth": "2001-12-21T00:00:00Z",
        "countryOfBirth": "Germany",
        "nationality": "Germany",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 143074,
        "name": "Famana Quizera",
        "position": "Midfielder",
        "dateOfBirth": "2002-04-25T00:00:00Z",
        "countryOfBirth": "Guinea-Bissau",
        "nationality": "Portugal",
        "shirtNumber": "null",
        "role": "PLAYER"
      }.with_indifferent_access,
      {
        "id": 150517,
        "name": "Rocco Reitz",
        "position": "Midfielder",
        "dateOfBirth": "2002-05-29T00:00:00Z",
        "countryOfBirth": "Germany",
        "nationality": "Germany",
        "shirtNumber": "null",
        "role": "PLAYER"
      }
    ],
    "lastUpdated": "2020-11-26T02:04:29Z"
  }.with_indifferent_access
end

def response_teams_all
  {
    "count": 18,
    "filters": {}.with_indifferent_access,
    "competition": {
      "id": 2002,
      "area": {
        "id": 2088,
        "name": "Germany"
      }.with_indifferent_access,
      "name": "Bundesliga",
      "code": "BL1",
      "plan": "TIER_ONE",
      "lastUpdated": "2021-03-22T01:20:06Z"
    }.with_indifferent_access,
    "season": {
      "id": 599,
      "startDate": "2020-09-18",
      "endDate": "2021-05-15",
      "currentMatchday": 27,
      "winner": "null"
    }.with_indifferent_access,
    "teams": [
      {
        "id": 1,
        "area": {
          "id": 2088,
          "name": "Germany"
        }.with_indifferent_access,
        "name": "1. FC Köln",
        "shortName": "1. FC Köln",
        "tla": "KOE",
        "crestUrl": "https://crests.football-data.org/1.svg",
        "address": "Franz-Kremer-Allee 1 Köln 50937",
        "phone": "+49 (221) 71616300",
        "website": "http://www.fc-koeln.de",
        "email": "info@fc-koeln.de",
        "founded": 1948,
        "clubColors": "Red / White",
        "venue": "RheinEnergieSTADION",
        "lastUpdated": "2020-11-26T02:10:38Z"
      }.with_indifferent_access,
      {
        "id": 2,
        "area": {
          "id": 2088,
          "name": "Germany"
        }.with_indifferent_access,
        "name": "TSG 1899 Hoffenheim",
        "shortName": "Hoffenheim",
        "tla": "TSG",
        "crestUrl": "https://crests.football-data.org/2.svg",
        "address": "Horrenberger Straße 58 Zuzenhausen 74939",
        "phone": "+49 (07261) 94930",
        "website": "http://www.achtzehn99.de",
        "email": "info@achtzehn99.de",
        "founded": 1921,
        "clubColors": "Blue / White",
        "venue": "PreZero Arena",
        "lastUpdated": "2021-02-15T08:45:46Z"
      }.with_indifferent_access,
      {
        "id": 3,
        "area": {
          "id": 2088,
          "name": "Germany"
        }.with_indifferent_access,
        "name": "Bayer 04 Leverkusen",
        "shortName": "Leverkusen",
        "tla": "B04",
        "crestUrl": "https://crests.football-data.org/3.svg",
        "address": "Bismarckstr. 122-124 Leverkusen 51373",
        "phone": "+49 (01805) 040404",
        "website": "http://www.bayer04.de",
        "email": "stefan.kusche.sk@bayer04.de",
        "founded": 1904,
        "clubColors": "Red / White / Black",
        "venue": "BayArena",
        "lastUpdated": "2021-02-15T08:45:48Z"
      }.with_indifferent_access,
      {
        "id": 4,
        "area": {
          "id": 2088,
          "name": "Germany"
        }.with_indifferent_access,
        "name": "Borussia Dortmund",
        "shortName": "Dortmund",
        "tla": "BVB",
        "crestUrl": "https://crests.football-data.org/4.svg",
        "address": "Rheinlanddamm 207-209 Dortmund 44137",
        "phone": "+49 (231) 90200",
        "website": "http://www.bvb.de",
        "email": "info@bvb.de",
        "founded": 1909,
        "clubColors": "Black / Yellow",
        "venue": "Signal Iduna Park",
        "lastUpdated": "2020-12-08T17:54:19Z"
      }.with_indifferent_access,
      {
        "id": 5,
        "area": {
          "id": 2088,
          "name": "Germany"
        }.with_indifferent_access,
        "name": "FC Bayern München",
        "shortName": "Bayern M",
        "tla": "FCB",
        "crestUrl": "https://crests.football-data.org/5.svg",
        "address": "Säbenerstr. 51 München 81547",
        "phone": "+49 (089) 699310",
        "website": "http://www.fcbayern.de",
        "email": "service-team@fcb.de",
        "founded": 1900,
        "clubColors": "Red / White / Blue",
        "venue": "Allianz Arena",
        "lastUpdated": "2020-11-26T02:04:16Z"
      }.with_indifferent_access,
      {
        "id": 6,
        "area": {
          "id": 2088,
          "name": "Germany"
        }.with_indifferent_access,
        "name": "FC Schalke 04",
        "shortName": "Schalke",
        "tla": "S04",
        "crestUrl": "https://crests.football-data.org/6.svg",
        "address": "Ernst-Kuzorra-Weg 1 Gelsenkirchen 45891",
        "phone": "+49 (0209) 36180",
        "website": "http://www.schalke04.de",
        "email": "post@schalke04.de",
        "founded": 1904,
        "clubColors": "Blue / White",
        "venue": "Veltins-Arena",
        "lastUpdated": "2020-11-26T02:04:18Z"
      }.with_indifferent_access,
      {
        "id": 9,
        "area": {
          "id": 2088,
          "name": "Germany"
        }.with_indifferent_access,
        "name": "Hertha BSC",
        "shortName": "Hertha BSC",
        "tla": "BSC",
        "crestUrl": "https://crests.football-data.org/9.svg",
        "address": "Hanns-Braun-Straße, Friesenhaus II Berlin 14053",
        "phone": "+49 (030) 3009280",
        "website": "http://www.herthabsc.de",
        "email": "info@herthabsc.de",
        "founded": 1892,
        "clubColors": "Blue / White",
        "venue": "Olympiastadion Berlin",
        "lastUpdated": "2020-11-26T02:04:20Z"
      }.with_indifferent_access,
      {
        "id": 10,
        "area": {
          "id": 2088,
          "name": "Germany"
        }.with_indifferent_access,
        "name": "VfB Stuttgart",
        "shortName": "Stuttgart",
        "tla": "VFB",
        "crestUrl": "https://crests.football-data.org/10.svg",
        "address": "Mercedesstraße 109 Stuttgart 70372",
        "phone": "+49 (1805) 832 5463",
        "website": "http://www.vfb.de",
        "email": "info@vfb-stuttgart.de",
        "founded": 1893,
        "clubColors": "White / Red",
        "venue": "Mercedes-Benz Arena",
        "lastUpdated": "2020-11-26T02:04:21Z"
      }.with_indifferent_access,
      {
        "id": 11,
        "area": {
          "id": 2088,
          "name": "Germany"
        }.with_indifferent_access,
        "name": "VfL Wolfsburg",
        "shortName": "Wolfsburg",
        "tla": "WOB",
        "crestUrl": "https://crests.football-data.org/11.svg",
        "address": "In den Allerwiesen 1 Wolfsburg 38446",
        "phone": "+49 (05361) 89030",
        "website": "http://www.vfl-wolfsburg.de",
        "email": "fussball@vfl-wolfsburg.de",
        "founded": 1945,
        "clubColors": "Green / White",
        "venue": "Volkswagen Arena",
        "lastUpdated": "2020-11-26T02:04:23Z"
      }.with_indifferent_access,
      {
        "id": 12,
        "area": {
          "id": 2088,
          "name": "Germany"
        }.with_indifferent_access,
        "name": "SV Werder Bremen",
        "shortName": "Bremen",
        "tla": "SVW",
        "crestUrl": "https://crests.football-data.org/12.svg",
        "address": "Franz-Böhmert-Str. 1c Bremen 28205",
        "phone": "+49 (01805) 937337",
        "website": "http://www.werder.de",
        "email": "info@werder-online.de",
        "founded": 1899,
        "clubColors": "Green / White",
        "venue": "Weserstadion",
        "lastUpdated": "2020-11-26T02:04:24Z"
      }.with_indifferent_access,
      {
        "id": 15,
        "area": {
          "id": 2088,
          "name": "Germany"
        }.with_indifferent_access,
        "name": "1. FSV Mainz 05",
        "shortName": "Mainz",
        "tla": "M05",
        "crestUrl": "https://crests.football-data.org/15.svg",
        "address": "Isaac-Fulda-Allee 5 Mainz 55124",
        "phone": "null",
        "website": "https://handball.mainz05.de",
        "email": "daniela.bilo@mainz05.de",
        "founded": 1926,
        "clubColors": "Red / White",
        "venue": "Opel Arena",
        "lastUpdated": "2020-11-26T02:04:25Z"
      }.with_indifferent_access,
      {
        "id": 16,
        "area": {
          "id": 2088,
          "name": "Germany"
        }.with_indifferent_access,
        "name": "FC Augsburg",
        "shortName": "Augsburg",
        "tla": "FCA",
        "crestUrl": "https://crests.football-data.org/16.svg",
        "address": "Donauwörther Straße 170 Augsburg 86154",
        "phone": "+49 (0821) 4554770",
        "website": "http://www.fcaugsburg.de",
        "email": "info@fcaugsburg.de",
        "founded": 1907,
        "clubColors": "Red / Green / White",
        "venue": "WWK Arena",
        "lastUpdated": "2020-11-26T02:04:27Z"
      }.with_indifferent_access,
      {
        "id": 17,
        "area": {
          "id": 2088,
          "name": "Germany"
        }.with_indifferent_access,
        "name": "SC Freiburg",
        "shortName": "Freiburg",
        "tla": "SCF",
        "crestUrl": "https://crests.football-data.org/17.svg",
        "address": "Schwarzwaldstraße 193 Freiburg 79117",
        "phone": "+49 (0761) 385510",
        "website": "http://www.scfreiburg.com",
        "email": "scf@scfreiburg.com",
        "founded": 1912,
        "clubColors": "Red / White",
        "venue": "Schwarzwald-Stadion",
        "lastUpdated": "2020-11-26T02:04:28Z"
      }.with_indifferent_access,
      {
        "id": 18,
        "area": {
          "id": 2088,
          "name": "Germany"
        }.with_indifferent_access,
        "name": "Borussia Mönchengladbach",
        "shortName": "M'gladbach",
        "tla": "BMG",
        "crestUrl": "https://crests.football-data.org/18.svg",
        "address": "Hennes-Weisweiler-Allee 1 Mönchengladbach 41179",
        "phone": "+49 (02161) 92930",
        "website": "http://www.borussia.de",
        "email": "info@borussia.de",
        "founded": 1900,
        "clubColors": "Black / White / Green",
        "venue": "Stadion im Borussia-Park",
        "lastUpdated": "2020-11-26T02:04:29Z"
      }.with_indifferent_access,
      {
        "id": 19,
        "area": {
          "id": 2088,
          "name": "Germany"
        }.with_indifferent_access,
        "name": "Eintracht Frankfurt",
        "shortName": "Frankfurt",
        "tla": "SGE",
        "crestUrl": "https://crests.football-data.org/19.svg",
        "address": "Mörfelder Landstraße 362 Frankfurt am Main 60528",
        "phone": "+49 (0180) 5060303",
        "website": "http://www.eintracht.de",
        "email": "info@eintracht-frankfurt.de",
        "founded": 1899,
        "clubColors": "Red / Black",
        "venue": "Deutsche Bank Park",
        "lastUpdated": "2020-11-26T02:04:32Z"
      }.with_indifferent_access,
      {
        "id": 28,
        "area": {
          "id": 2088,
          "name": "Germany"
        }.with_indifferent_access,
        "name": "1. FC Union Berlin",
        "shortName": "Union Berlin",
        "tla": "UNB",
        "crestUrl": "https://crests.football-data.org/28.svg",
        "address": "An der Wuhlheide 263 Berlin 12555",
        "phone": "+49 (030) 6566880",
        "website": "http://www.fc-union-berlin.de",
        "email": "verein@fc-union-berlin.de",
        "founded": 1906,
        "clubColors": "Red / White",
        "venue": "Stadion An der Alten Försterei",
        "lastUpdated": "2020-11-26T02:04:33Z"
      }.with_indifferent_access,
      {
        "id": 38,
        "area": {
          "id": 2088,
          "name": "Germany"
        }.with_indifferent_access,
        "name": "Arminia Bielefeld",
        "shortName": "Bielefeld",
        "tla": "BIE",
        "crestUrl": "https://crests.football-data.org/38.svg",
        "address": "Melanchthonstraße 31a Bielefeld 33615",
        "phone": "+49 (0521) 966110",
        "website": "http://www.arminia-bielefeld.de",
        "email": "kontakt@arminia-bielefeld.de",
        "founded": 1905,
        "clubColors": "Black / White / Blue",
        "venue": "SchücoArena Kunstrasenplatz",
        "lastUpdated": "2021-02-15T17:32:29Z"
      }.with_indifferent_access,
      {
        "id": 721,
        "area": {
          "id": 2088,
          "name": "Germany"
        }.with_indifferent_access,
        "name": "RB Leipzig",
        "shortName": "RB Leipzig",
        "tla": "RBL",
        "crestUrl": "https://crests.football-data.org/721.svg",
        "address": "Neumarkt 29-33 Leipzig 04109",
        "phone": "+49 (0341) 1247970",
        "website": "http://www.dierotenbullen.com",
        "email": "soccerrbl.office@redbulls.com",
        "founded": 2009,
        "clubColors": "White / Red",
        "venue": "Red Bull Arena",
        "lastUpdated": "2020-11-26T02:04:36Z"
      }
    ]
  }.with_indifferent_access
end

def response_teams
  [
    {
      "id": 1,
      "area": {
        "id": 2088,
        "name": "Germany"
      }.with_indifferent_access,
      "name": "1. FC Köln",
      "shortName": "1. FC Köln",
      "tla": "KOE",
      "crestUrl": "https://crests.football-data.org/1.svg",
      "address": "Franz-Kremer-Allee 1 Köln 50937",
      "phone": "+49 (221) 71616300",
      "website": "http://www.fc-koeln.de",
      "email": "info@fc-koeln.de",
      "founded": 1948,
      "clubColors": "Red / White",
      "venue": "RheinEnergieSTADION",
      "lastUpdated": "2020-11-26T02:10:38Z"
    }.with_indifferent_access,
    {
      "id": 2,
      "area": {
        "id": 2088,
        "name": "Germany"
      }.with_indifferent_access,
      "name": "TSG 1899 Hoffenheim",
      "shortName": "Hoffenheim",
      "tla": "TSG",
      "crestUrl": "https://crests.football-data.org/2.svg",
      "address": "Horrenberger Straße 58 Zuzenhausen 74939",
      "phone": "+49 (07261) 94930",
      "website": "http://www.achtzehn99.de",
      "email": "info@achtzehn99.de",
      "founded": 1921,
      "clubColors": "Blue / White",
      "venue": "PreZero Arena",
      "lastUpdated": "2021-02-15T08:45:46Z"
    }.with_indifferent_access,
    {
      "id": 3,
      "area": {
        "id": 2088,
        "name": "Germany"
      }.with_indifferent_access,
      "name": "Bayer 04 Leverkusen",
      "shortName": "Leverkusen",
      "tla": "B04",
      "crestUrl": "https://crests.football-data.org/3.svg",
      "address": "Bismarckstr. 122-124 Leverkusen 51373",
      "phone": "+49 (01805) 040404",
      "website": "http://www.bayer04.de",
      "email": "stefan.kusche.sk@bayer04.de",
      "founded": 1904,
      "clubColors": "Red / White / Black",
      "venue": "BayArena",
      "lastUpdated": "2021-02-15T08:45:48Z"
    }.with_indifferent_access,
    {
      "id": 4,
      "area": {
        "id": 2088,
        "name": "Germany"
      }.with_indifferent_access,
      "name": "Borussia Dortmund",
      "shortName": "Dortmund",
      "tla": "BVB",
      "crestUrl": "https://crests.football-data.org/4.svg",
      "address": "Rheinlanddamm 207-209 Dortmund 44137",
      "phone": "+49 (231) 90200",
      "website": "http://www.bvb.de",
      "email": "info@bvb.de",
      "founded": 1909,
      "clubColors": "Black / Yellow",
      "venue": "Signal Iduna Park",
      "lastUpdated": "2020-12-08T17:54:19Z"
    }.with_indifferent_access,
    {
      "id": 5,
      "area": {
        "id": 2088,
        "name": "Germany"
      }.with_indifferent_access,
      "name": "FC Bayern München",
      "shortName": "Bayern M",
      "tla": "FCB",
      "crestUrl": "https://crests.football-data.org/5.svg",
      "address": "Säbenerstr. 51 München 81547",
      "phone": "+49 (089) 699310",
      "website": "http://www.fcbayern.de",
      "email": "service-team@fcb.de",
      "founded": 1900,
      "clubColors": "Red / White / Blue",
      "venue": "Allianz Arena",
      "lastUpdated": "2020-11-26T02:04:16Z"
    }.with_indifferent_access,
    {
      "id": 6,
      "area": {
        "id": 2088,
        "name": "Germany"
      }.with_indifferent_access,
      "name": "FC Schalke 04",
      "shortName": "Schalke",
      "tla": "S04",
      "crestUrl": "https://crests.football-data.org/6.svg",
      "address": "Ernst-Kuzorra-Weg 1 Gelsenkirchen 45891",
      "phone": "+49 (0209) 36180",
      "website": "http://www.schalke04.de",
      "email": "post@schalke04.de",
      "founded": 1904,
      "clubColors": "Blue / White",
      "venue": "Veltins-Arena",
      "lastUpdated": "2020-11-26T02:04:18Z"
    }.with_indifferent_access,
    {
      "id": 9,
      "area": {
        "id": 2088,
        "name": "Germany"
      }.with_indifferent_access,
      "name": "Hertha BSC",
      "shortName": "Hertha BSC",
      "tla": "BSC",
      "crestUrl": "https://crests.football-data.org/9.svg",
      "address": "Hanns-Braun-Straße, Friesenhaus II Berlin 14053",
      "phone": "+49 (030) 3009280",
      "website": "http://www.herthabsc.de",
      "email": "info@herthabsc.de",
      "founded": 1892,
      "clubColors": "Blue / White",
      "venue": "Olympiastadion Berlin",
      "lastUpdated": "2020-11-26T02:04:20Z"
    }.with_indifferent_access,
    {
      "id": 10,
      "area": {
        "id": 2088,
        "name": "Germany"
      }.with_indifferent_access,
      "name": "VfB Stuttgart",
      "shortName": "Stuttgart",
      "tla": "VFB",
      "crestUrl": "https://crests.football-data.org/10.svg",
      "address": "Mercedesstraße 109 Stuttgart 70372",
      "phone": "+49 (1805) 832 5463",
      "website": "http://www.vfb.de",
      "email": "info@vfb-stuttgart.de",
      "founded": 1893,
      "clubColors": "White / Red",
      "venue": "Mercedes-Benz Arena",
      "lastUpdated": "2020-11-26T02:04:21Z"
    }.with_indifferent_access,
    {
      "id": 11,
      "area": {
        "id": 2088,
        "name": "Germany"
      }.with_indifferent_access,
      "name": "VfL Wolfsburg",
      "shortName": "Wolfsburg",
      "tla": "WOB",
      "crestUrl": "https://crests.football-data.org/11.svg",
      "address": "In den Allerwiesen 1 Wolfsburg 38446",
      "phone": "+49 (05361) 89030",
      "website": "http://www.vfl-wolfsburg.de",
      "email": "fussball@vfl-wolfsburg.de",
      "founded": 1945,
      "clubColors": "Green / White",
      "venue": "Volkswagen Arena",
      "lastUpdated": "2020-11-26T02:04:23Z"
    }.with_indifferent_access,
    {
      "id": 12,
      "area": {
        "id": 2088,
        "name": "Germany"
      }.with_indifferent_access,
      "name": "SV Werder Bremen",
      "shortName": "Bremen",
      "tla": "SVW",
      "crestUrl": "https://crests.football-data.org/12.svg",
      "address": "Franz-Böhmert-Str. 1c Bremen 28205",
      "phone": "+49 (01805) 937337",
      "website": "http://www.werder.de",
      "email": "info@werder-online.de",
      "founded": 1899,
      "clubColors": "Green / White",
      "venue": "Weserstadion",
      "lastUpdated": "2020-11-26T02:04:24Z"
    }.with_indifferent_access,
    {
      "id": 15,
      "area": {
        "id": 2088,
        "name": "Germany"
      }.with_indifferent_access,
      "name": "1. FSV Mainz 05",
      "shortName": "Mainz",
      "tla": "M05",
      "crestUrl": "https://crests.football-data.org/15.svg",
      "address": "Isaac-Fulda-Allee 5 Mainz 55124",
      "phone": "null",
      "website": "https://handball.mainz05.de",
      "email": "daniela.bilo@mainz05.de",
      "founded": 1926,
      "clubColors": "Red / White",
      "venue": "Opel Arena",
      "lastUpdated": "2020-11-26T02:04:25Z"
    }.with_indifferent_access,
    {
      "id": 16,
      "area": {
        "id": 2088,
        "name": "Germany"
      }.with_indifferent_access,
      "name": "FC Augsburg",
      "shortName": "Augsburg",
      "tla": "FCA",
      "crestUrl": "https://crests.football-data.org/16.svg",
      "address": "Donauwörther Straße 170 Augsburg 86154",
      "phone": "+49 (0821) 4554770",
      "website": "http://www.fcaugsburg.de",
      "email": "info@fcaugsburg.de",
      "founded": 1907,
      "clubColors": "Red / Green / White",
      "venue": "WWK Arena",
      "lastUpdated": "2020-11-26T02:04:27Z"
    }.with_indifferent_access,
    {
      "id": 17,
      "area": {
        "id": 2088,
        "name": "Germany"
      }.with_indifferent_access,
      "name": "SC Freiburg",
      "shortName": "Freiburg",
      "tla": "SCF",
      "crestUrl": "https://crests.football-data.org/17.svg",
      "address": "Schwarzwaldstraße 193 Freiburg 79117",
      "phone": "+49 (0761) 385510",
      "website": "http://www.scfreiburg.com",
      "email": "scf@scfreiburg.com",
      "founded": 1912,
      "clubColors": "Red / White",
      "venue": "Schwarzwald-Stadion",
      "lastUpdated": "2020-11-26T02:04:28Z"
    }.with_indifferent_access,
    {
      "id": 18,
      "area": {
        "id": 2088,
        "name": "Germany"
      }.with_indifferent_access,
      "name": "Borussia Mönchengladbach",
      "shortName": "M'gladbach",
      "tla": "BMG",
      "crestUrl": "https://crests.football-data.org/18.svg",
      "address": "Hennes-Weisweiler-Allee 1 Mönchengladbach 41179",
      "phone": "+49 (02161) 92930",
      "website": "http://www.borussia.de",
      "email": "info@borussia.de",
      "founded": 1900,
      "clubColors": "Black / White / Green",
      "venue": "Stadion im Borussia-Park",
      "lastUpdated": "2020-11-26T02:04:29Z"
    }.with_indifferent_access,
    {
      "id": 19,
      "area": {
        "id": 2088,
        "name": "Germany"
      }.with_indifferent_access,
      "name": "Eintracht Frankfurt",
      "shortName": "Frankfurt",
      "tla": "SGE",
      "crestUrl": "https://crests.football-data.org/19.svg",
      "address": "Mörfelder Landstraße 362 Frankfurt am Main 60528",
      "phone": "+49 (0180) 5060303",
      "website": "http://www.eintracht.de",
      "email": "info@eintracht-frankfurt.de",
      "founded": 1899,
      "clubColors": "Red / Black",
      "venue": "Deutsche Bank Park",
      "lastUpdated": "2020-11-26T02:04:32Z"
    }.with_indifferent_access,
    {
      "id": 28,
      "area": {
        "id": 2088,
        "name": "Germany"
      }.with_indifferent_access,
      "name": "1. FC Union Berlin",
      "shortName": "Union Berlin",
      "tla": "UNB",
      "crestUrl": "https://crests.football-data.org/28.svg",
      "address": "An der Wuhlheide 263 Berlin 12555",
      "phone": "+49 (030) 6566880",
      "website": "http://www.fc-union-berlin.de",
      "email": "verein@fc-union-berlin.de",
      "founded": 1906,
      "clubColors": "Red / White",
      "venue": "Stadion An der Alten Försterei",
      "lastUpdated": "2020-11-26T02:04:33Z"
    }.with_indifferent_access,
    {
      "id": 38,
      "area": {
        "id": 2088,
        "name": "Germany"
      }.with_indifferent_access,
      "name": "Arminia Bielefeld",
      "shortName": "Bielefeld",
      "tla": "BIE",
      "crestUrl": "https://crests.football-data.org/38.svg",
      "address": "Melanchthonstraße 31a Bielefeld 33615",
      "phone": "+49 (0521) 966110",
      "website": "http://www.arminia-bielefeld.de",
      "email": "kontakt@arminia-bielefeld.de",
      "founded": 1905,
      "clubColors": "Black / White / Blue",
      "venue": "SchücoArena Kunstrasenplatz",
      "lastUpdated": "2021-02-15T17:32:29Z"
    }.with_indifferent_access,
    {
      "id": 721,
      "area": {
        "id": 2088,
        "name": "Germany"
      }.with_indifferent_access,
      "name": "RB Leipzig",
      "shortName": "RB Leipzig",
      "tla": "RBL",
      "crestUrl": "https://crests.football-data.org/721.svg",
      "address": "Neumarkt 29-33 Leipzig 04109",
      "phone": "+49 (0341) 1247970",
      "website": "http://www.dierotenbullen.com",
      "email": "soccerrbl.office@redbulls.com",
      "founded": 2009,
      "clubColors": "White / Red",
      "venue": "Red Bull Arena",
      "lastUpdated": "2020-11-26T02:04:36Z"
    }.with_indifferent_access
  ]
end

def response_teams_filter_year
  [
    {
      "id": 1,
      "area": {
        "id": 2088,
        "name": "Germany"
      }.with_indifferent_access,
      "name": "1. FC Köln",
      "shortName": "1. FC Köln",
      "tla": "KOE",
      "crestUrl": "https://crests.football-data.org/1.svg",
      "address": "Franz-Kremer-Allee 1 Köln 50937",
      "phone": "+49 (221) 71616300",
      "website": "http://www.fc-koeln.de",
      "email": "info@fc-koeln.de",
      "founded": 1948,
      "clubColors": "Red / White",
      "venue": "RheinEnergieSTADION",
      "lastUpdated": "2020-11-26T02:10:38Z"
    }.with_indifferent_access,
    {
      "id": 2,
      "area": {
        "id": 2088,
        "name": "Germany"
      }.with_indifferent_access,
      "name": "TSG 1899 Hoffenheim",
      "shortName": "Hoffenheim",
      "tla": "TSG",
      "crestUrl": "https://crests.football-data.org/2.svg",
      "address": "Horrenberger Straße 58 Zuzenhausen 74939",
      "phone": "+49 (07261) 94930",
      "website": "http://www.achtzehn99.de",
      "email": "info@achtzehn99.de",
      "founded": 1921,
      "clubColors": "Blue / White",
      "venue": "PreZero Arena",
      "lastUpdated": "2021-02-15T08:45:46Z"
    }.with_indifferent_access,
    {
      "id": 3,
      "area": {
        "id": 2088,
        "name": "Germany"
      }.with_indifferent_access,
      "name": "Bayer 04 Leverkusen",
      "shortName": "Leverkusen",
      "tla": "B04",
      "crestUrl": "https://crests.football-data.org/3.svg",
      "address": "Bismarckstr. 122-124 Leverkusen 51373",
      "phone": "+49 (01805) 040404",
      "website": "http://www.bayer04.de",
      "email": "stefan.kusche.sk@bayer04.de",
      "founded": 1904,
      "clubColors": "Red / White / Black",
      "venue": "BayArena",
      "lastUpdated": "2021-02-15T08:45:48Z"
    }.with_indifferent_access
  ]
end
