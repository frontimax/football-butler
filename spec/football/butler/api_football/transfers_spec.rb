# frozen_string_literal: true

RSpec.describe Football::Butler::Transfers do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_API_FOOTBALL,
      api_name: :api_football_com
    )

    stubs_transfers
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_player' do
    context 'success' do
      it 'returns transfers' do
        response = described_class.by_player(player: 1540)

        expect(response).to be_a(Array)
        expect(response).to match_array(response_transfers)
      end
    end
  end

  describe 'when by_team' do
    context 'success' do
      it 'returns transfers' do
        response = described_class.by_team(team: 1540)

        expect(response).to be_a(Array)
        expect(response).to match_array(response_transfers)
      end
    end
  end
end

def stubs_transfers
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/transfers?player=1540")
    .to_return(status: 200, body: get_mocked_response('transfers.json', :api_football))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/transfers?team=1540")
    .to_return(status: 200, body: get_mocked_response('transfers.json', :api_football))
end

def response_transfers
  [
    {
      "player": {
        "id": 1540,
        "name": "Araz Abdullayev"
      }.with_indifferent_access,
      "update": "2021-08-22T08:38:22+00:00",
      "transfers": [
                  {
                    "date": "2020-09-14",
                    "type": "Free",
                    "teams": {
                      "in": {
                        "id": 3569,
                        "name": "Boluspor",
                        "logo": "https://media.api-sports.io/football/teams/3569.png"
                      }.with_indifferent_access,
                      "out": {
                        "id": 556,
                        "name": "Qarabag",
                        "logo": "https://media.api-sports.io/football/teams/556.png"
                      }.with_indifferent_access
                    }.with_indifferent_access
                  }.with_indifferent_access,
                  {
                    "date": "2018-07-01",
                    "type": "N/A",
                    "teams": {
                      "in": {
                        "id": 556,
                        "name": "Qarabag",
                        "logo": "https://media.api-sports.io/football/teams/556.png"
                      }.with_indifferent_access,
                      "out": {
                        "id": 627,
                        "name": "Qabala",
                        "logo": "https://media.api-sports.io/football/teams/627.png"
                      }.with_indifferent_access
                    }.with_indifferent_access
                  }.with_indifferent_access,
                  {
                    "date": "2017-08-14",
                    "type": "Loan",
                    "teams": {
                      "in": {
                        "id": 2269,
                        "name": "Anorthosis",
                        "logo": "https://media.api-sports.io/football/teams/2269.png"
                      }.with_indifferent_access,
                      "out": {
                        "id": 627,
                        "name": "Qabala",
                        "logo": "https://media.api-sports.io/football/teams/627.png"
                      }.with_indifferent_access
                    }.with_indifferent_access
                  }.with_indifferent_access,
                  {
                    "date": "2017-01-01",
                    "type": "N/A",
                    "teams": {
                      "in": {
                        "id": 627,
                        "name": "Qabala",
                        "logo": "https://media.api-sports.io/football/teams/627.png"
                      }.with_indifferent_access,
                      "out": {
                        "id": 2270,
                        "name": "Neftchi Baku",
                        "logo": "https://media.api-sports.io/football/teams/2270.png"
                      }.with_indifferent_access
                    }.with_indifferent_access
                  }.with_indifferent_access,
                  {
                    "date": "2012-07-01",
                    "type": "N/A",
                    "teams": {
                      "in": {
                        "id": 2270,
                        "name": "Neftchi Baku",
                        "logo": "https://media.api-sports.io/football/teams/2270.png"
                      }.with_indifferent_access,
                      "out": {
                        "id": 622,
                        "name": "Panionios",
                        "logo": "https://media.api-sports.io/football/teams/622.png"
                      }.with_indifferent_access
                    }.with_indifferent_access
                  }.with_indifferent_access
                ]
    }.with_indifferent_access
  ]
end
