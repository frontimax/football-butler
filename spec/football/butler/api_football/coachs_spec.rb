# frozen_string_literal: true

RSpec.describe Football::Butler::Coachs do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_API_FOOTBALL,
      api_name: :api_football_com
    )

    stubs_coachs
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_id' do
    context 'success' do
      it 'returns coachs' do
        response = described_class.by_id(id: 1540)

        expect(response).to be_a(Array)
        expect(response).to match_array(response_coachs)
      end
    end
  end

  describe 'when search_by_name' do
    context 'success' do
      it 'returns coachs' do
        response = described_class.search_by_name(name: 'Rose')

        expect(response).to be_a(Array)
        expect(response).to match_array(response_coachs)
      end
    end
  end

  describe 'when by_team' do
    context 'success' do
      it 'returns coachs' do
        response = described_class.by_team(team: 1540)

        expect(response).to be_a(Array)
        expect(response).to match_array(response_coachs)
      end
    end
  end
end

def stubs_coachs
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/coachs?id=1540")
    .to_return(status: 200, body: get_mocked_response('coachs.json', :api_football))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/coachs?search=Rose")
    .to_return(status: 200, body: get_mocked_response('coachs.json', :api_football))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/coachs?team=1540")
    .to_return(status: 200, body: get_mocked_response('coachs.json', :api_football))
end

def response_coachs
  [
    {
      "id": 1540,
      "name": "M. Rose",
      "firstname": "Marco",
      "lastname": "Rose",
      "age": 45,
      "birth": {
        "date": "1976-09-11",
        "place": "Leipzig",
        "country": "Germany"
      }.with_indifferent_access,
      "nationality": "Germany",
      "height": "187 cm",
      "weight": "83 kg",
      "photo": "https://media.api-sports.io/football/coachs/1540.png",
      "team": {
        "id": 165,
        "name": "Borussia Dortmund",
        "logo": "https://media.api-sports.io/football/teams/165.png"
      }.with_indifferent_access,
      "career": [
              {
                "team": {
                  "id": 165,
                  "name": "Borussia Dortmund",
                  "logo": "https://media.api-sports.io/football/teams/165.png"
                }.with_indifferent_access,
                "start": "2021-07-01",
                "end": ""
              }.with_indifferent_access,
              {
                "team": {
                  "id": 163,
                  "name": "Borussia M'gladbach",
                  "logo": "https://media.api-sports.io/football/teams/163.png"
                }.with_indifferent_access,
                "start": "2019-07-01",
                "end": "2021-06-01"
              }.with_indifferent_access,
              {
                "team": {
                  "id": 571,
                  "name": "Salzburg",
                  "logo": "https://media.api-sports.io/football/teams/571.png"
                }.with_indifferent_access,
                "start": "2017-06-01",
                "end": "2019-06-01"
              }.with_indifferent_access,
              {
                "team": {
                  "id": 7928,
                  "name": "Salzburg U19",
                  "logo": "https://media.api-sports.io/football/teams/7928.png"
                }.with_indifferent_access,
                "start": "2016-07-01",
                "end": "2017-06-01"
              }.with_indifferent_access,
              {
                "team": {
                  "id": 9355,
                  "name": "Lokomotive Leipzig",
                  "logo": "https://media.api-sports.io/football/teams/9355.png"
                }.with_indifferent_access,
                "start": "2012-07-01",
                "end": "2013-06-01"
              }.with_indifferent_access
            ]
    }.with_indifferent_access
  ]
end
