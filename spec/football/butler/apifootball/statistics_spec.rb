# frozen_string_literal: true

RSpec.describe Football::Butler::Statistics do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_APIFOOTBALL,
      api_name: :apifootball_com
    )

    stubs_statistics_apifootball
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_id' do
    it 'returns one statistic' do
      response = described_class.by_match(id: 86392)

      expect(response).to be_a(Hash)
      expect(response).to include(response_statistic_apifootball.stringify_keys)
    end
  end
end

def stubs_statistics_apifootball
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}APIkey=my_dummy_token&action=get_statistics&match_id=86392")
    .to_return(status: 200, body: get_mocked_response('statistics.json', :apifootball))
end

def response_statistic_apifootball
  {
    "86392": {
      "statistics": [
        {
          "type": "Shots Total",
          "home": "14",
          "away": "5"
        }.with_indifferent_access,
        {
          "type": "Shots On Goal",
          "home": "9",
          "away": "2"
        }.with_indifferent_access,
        {
          "type": "Shots Off Goal",
          "home": "4",
          "away": "2"
        }.with_indifferent_access
      ]
    }.with_indifferent_access
  }.with_indifferent_access
end
