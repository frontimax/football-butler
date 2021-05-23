# frozen_string_literal: true

RSpec.describe Football::Butler::Scorers do
  before do
    stubs_scorers
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_competition' do
    context 'success' do
      it 'returns scorers' do
        response = described_class.by_competition(id: 2002)

        expect(response).to be_a(Array)
        expect(response).to match_array(response_scorers)
      end
    end

    context 'error' do
      it 'returns scorers' do
        response = described_class.by_competition(id: 1)

        expect(response).to be_a(Hash)
        expect(response['message']).to eq("The resource you are looking for does not exist.")
      end
    end
  end
end

def stubs_scorers
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/competitions/2002/scorers")
    .to_return(status: 200, body: get_mocked_response('scorers.json', :football_data))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/competitions/1/scorers")
    .to_return(status: 200, body: get_mocked_response('resource_missing.json', :football_data))
end

def response_scorers
  [
    {
      "player": {
        "id": 371,
        "name": "Robert Lewandowski",
        "firstName": "Robert",
        "lastName": "",
        "dateOfBirth": "1988-08-21",
        "countryOfBirth": "Poland",
        "nationality": "Poland",
        "position": "Attacker",
        "shirtNumber": "",
        "lastUpdated": "2021-03-05T13:51:30Z"
      }.with_indifferent_access,
      "team": {
        "id": 5,
        "name": "FC Bayern München"
      }.with_indifferent_access,
      "numberOfGoals": 41
    }.with_indifferent_access,
    {
      "player": {
        "id": 1760,
        "name": "André Silva",
        "firstName": "André Miguel",
        "lastName": "",
        "dateOfBirth": "1995-11-06",
        "countryOfBirth": "Portugal",
        "nationality": "Portugal",
        "position": "Attacker",
        "shirtNumber": "",
        "lastUpdated": "2021-05-14T16:12:30Z"
      }.with_indifferent_access,
      "team": {
        "id": 19,
        "name": "Eintracht Frankfurt"
      }.with_indifferent_access,
      "numberOfGoals": 28
    }.with_indifferent_access,
    {
      "player": {
        "id": 38101,
        "name": "Erling Haaland",
        "firstName": "Erling Braut",
        "lastName": "",
        "dateOfBirth": "2000-07-21",
        "countryOfBirth": "England",
        "nationality": "Norway",
        "position": "Attacker",
        "shirtNumber": "",
        "lastUpdated": "2020-09-07T18:47:42Z"
      }.with_indifferent_access,
      "team": {
        "id": 4,
        "name": "Borussia Dortmund"
      }.with_indifferent_access,
      "numberOfGoals": 27
    }.with_indifferent_access,
    {
      "player": {
        "id": 318,
        "name": "Andrej Kramarić",
        "firstName": "Andrej",
        "lastName": "",
        "dateOfBirth": "1991-06-19",
        "countryOfBirth": "Croatia",
        "nationality": "Croatia",
        "position": "Attacker",
        "shirtNumber": "",
        "lastUpdated": "2020-11-26T02:04:12Z"
      }.with_indifferent_access,
      "team": {
        "id": 2,
        "name": "TSG 1899 Hoffenheim"
      }.with_indifferent_access,
      "numberOfGoals": 20
    }.with_indifferent_access,
    {
      "player": {
        "id": 7697,
        "name": "Wout Weghorst",
        "firstName": "Wout",
        "lastName": "",
        "dateOfBirth": "1992-08-07",
        "countryOfBirth": "Netherlands",
        "nationality": "Netherlands",
        "position": "Attacker",
        "shirtNumber": "",
        "lastUpdated": "2020-09-07T18:47:50Z"
      }.with_indifferent_access,
      "team": {
        "id": 11,
        "name": "VfL Wolfsburg"
      }.with_indifferent_access,
      "numberOfGoals": 20
    }.with_indifferent_access,
    {
      "player": {
        "id": 10761,
        "name": "Saša Kalajdžić",
        "firstName": "Saša",
        "lastName": "",
        "dateOfBirth": "1997-07-07",
        "countryOfBirth": "Austria",
        "nationality": "Austria",
        "position": "Attacker",
        "shirtNumber": "",
        "lastUpdated": "2020-10-22T02:10:57Z"
      }.with_indifferent_access,
      "team": {
        "id": 10,
        "name": "VfB Stuttgart"
      }.with_indifferent_access,
      "numberOfGoals": 16
    }.with_indifferent_access,
    {
      "player": {
        "id": 3185,
        "name": "Lars Stindl",
        "firstName": "Lars",
        "lastName": "",
        "dateOfBirth": "1988-08-26",
        "countryOfBirth": "Germany",
        "nationality": "Germany",
        "position": "Midfielder",
        "shirtNumber": "",
        "lastUpdated": "2021-01-20T15:20:20Z"
      }.with_indifferent_access,
      "team": {
        "id": 18,
        "name": "Borussia Mönchengladbach"
      }.with_indifferent_access,
      "numberOfGoals": 14
    }.with_indifferent_access,
    {
      "player": {
        "id": 370,
        "name": "Thomas Müller",
        "firstName": "Thomas",
        "lastName": "",
        "dateOfBirth": "1989-09-13",
        "countryOfBirth": "Germany",
        "nationality": "Germany",
        "position": "Attacker",
        "shirtNumber": "",
        "lastUpdated": "2021-03-05T13:51:30Z"
      }.with_indifferent_access,
      "team": {
        "id": 5,
        "name": "FC Bayern München"
      }.with_indifferent_access,
      "numberOfGoals": 11
    }.with_indifferent_access,
    {
      "player": {
        "id": 82354,
        "name": "Silas Wamangituka",
        "firstName": "Silas Fundu",
        "lastName": "",
        "dateOfBirth": "1999-10-06",
        "countryOfBirth": "Congo DR",
        "nationality": "Congo DR",
        "position": "Attacker",
        "shirtNumber": "",
        "lastUpdated": "2020-09-07T18:47:49Z"
      }.with_indifferent_access,
      "team": {
        "id": 10,
        "name": "VfB Stuttgart"
      }.with_indifferent_access,
      "numberOfGoals": 11
    }.with_indifferent_access,
    {
      "player": {
        "id": 9463,
        "name": "Max Kruse",
        "firstName": "Max",
        "lastName": "",
        "dateOfBirth": "1988-03-19",
        "countryOfBirth": "Germany",
        "nationality": "Germany",
        "position": "Attacker",
        "shirtNumber": "",
        "lastUpdated": "2020-09-07T18:48:06Z"
      }.with_indifferent_access,
      "team": {
        "id": 28,
        "name": "1. FC Union Berlin"
      }.with_indifferent_access,
      "numberOfGoals": 11
    }.with_indifferent_access
  ]
end
