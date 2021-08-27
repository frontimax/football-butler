# frozen_string_literal: true

RSpec.describe Football::Butler::Statistics do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_API_FOOTBALL,
      api_name: :api_football_com
    )

    stubs_statistics_api_football
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_id' do
    it 'returns one statistic' do
      response = described_class.by_match(id: 719364)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_statistic_api_football)
    end
  end
end

def stubs_statistics_api_football
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/fixtures/statistics?fixture=719364")
    .to_return(status: 200, body: get_mocked_response('statistics.json', :api_football))
end

def response_statistic_api_football
  [
    {
      "team": {
        "id": 159,
        "name": "Hertha Berlin",
        "logo": "https://media.api-sports.io/football/teams/159.png"
      }.with_indifferent_access,
      "statistics": [
                {
                  "type": "Shots on Goal",
                  "value": 5
                }.with_indifferent_access,
                {
                  "type": "Shots off Goal",
                  "value": 4
                }.with_indifferent_access,
                {
                  "type": "Total Shots",
                  "value": 13
                }.with_indifferent_access,
                {
                  "type": "Blocked Shots",
                  "value": 4
                }.with_indifferent_access,
                {
                  "type": "Shots insidebox",
                  "value": 7
                }.with_indifferent_access,
                {
                  "type": "Shots outsidebox",
                  "value": 6
                }.with_indifferent_access,
                {
                  "type": "Fouls",
                  "value": 12
                }.with_indifferent_access,
                {
                  "type": "Corner Kicks",
                  "value": 4
                }.with_indifferent_access,
                {
                  "type": "Offsides",
                  "value": ""
                }.with_indifferent_access,
                {
                  "type": "Ball Possession",
                  "value": "41%"
                }.with_indifferent_access,
                {
                  "type": "Yellow Cards",
                  "value": 1
                }.with_indifferent_access,
                {
                  "type": "Red Cards",
                  "value": ""
                }.with_indifferent_access,
                {
                  "type": "Goalkeeper Saves",
                  "value": 1
                }.with_indifferent_access,
                {
                  "type": "Total passes",
                  "value": 328
                }.with_indifferent_access,
                {
                  "type": "Passes accurate",
                  "value": 254
                }.with_indifferent_access,
                {
                  "type": "Passes %",
                  "value": "77%"
                }.with_indifferent_access
              ]
    }.with_indifferent_access,
    {
      "team": {
        "id": 161,
        "name": "VfL Wolfsburg",
        "logo": "https://media.api-sports.io/football/teams/161.png"
      }.with_indifferent_access,
      "statistics": [
                {
                  "type": "Shots on Goal",
                  "value": 3
                }.with_indifferent_access,
                {
                  "type": "Shots off Goal",
                  "value": 5
                }.with_indifferent_access,
                {
                  "type": "Total Shots",
                  "value": 12
                }.with_indifferent_access,
                {
                  "type": "Blocked Shots",
                  "value": 4
                }.with_indifferent_access,
                {
                  "type": "Shots insidebox",
                  "value": 12
                }.with_indifferent_access,
                {
                  "type": "Shots outsidebox",
                  "value": ""
                }.with_indifferent_access,
                {
                  "type": "Fouls",
                  "value": 22
                }.with_indifferent_access,
                {
                  "type": "Corner Kicks",
                  "value": 4
                }.with_indifferent_access,
                {
                  "type": "Offsides",
                  "value": 1
                }.with_indifferent_access,
                {
                  "type": "Ball Possession",
                  "value": "59%"
                }.with_indifferent_access,
                {
                  "type": "Yellow Cards",
                  "value": 2
                }.with_indifferent_access,
                {
                  "type": "Red Cards",
                  "value": ""
                }.with_indifferent_access,
                {
                  "type": "Goalkeeper Saves",
                  "value": 4
                }.with_indifferent_access,
                {
                  "type": "Total passes",
                  "value": 475
                }.with_indifferent_access,
                {
                  "type": "Passes accurate",
                  "value": 409
                }.with_indifferent_access,
                {
                  "type": "Passes %",
                  "value": "86%"
                }.with_indifferent_access
              ]
    }.with_indifferent_access
  ]
end
