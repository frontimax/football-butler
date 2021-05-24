# frozen_string_literal: true

RSpec.describe Football::Butler::Odds do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_APIFOOTBALL,
      api_name: :apifootball_com
    )

    stubs_odds_apifootball
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_id' do
    it 'returns one odd' do
      response = described_class.by_match(id: 86392, from: '2021-05-22', to: '2021-05-22')

      expect(response).to be_a(Array)
      expect(response).to match_array(response_odd_apifootball)
    end
  end
end

def stubs_odds_apifootball
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}APIkey=my_dummy_token&action=get_odds&match_id=86392&from=2021-05-22&to=2021-05-22")
    .to_return(status: 200, body: get_mocked_response('odds.json', :apifootball))
end

def response_odd_apifootball
  [
    {
      "match_id": "137523",
      "odd_bookmakers": "bwin",
      "odd_date": "2021-04-17 20:26:25",
      "odd_1": "1.67",
      "odd_x": "3.50",
      "odd_2": "4.50",
      "odd_1x": "1.16",
      "odd_12": "1.25",
      "odd_x2": "2.00",
      "ah-4.5_1": "",
      "ah-4.5_2": "",
      "ah-4_1": "",
      "ah-4_2": "",
      "ah-3.5_1": "",
      "ah-3.5_2": "",
      "ah-3_1": "",
      "ah-3_2": "",
      "ah-2.5_1": "",
      "ah-2.5_2": "",
      "ah-2_1": "",
      "ah-2_2": "",
      "ah-1.5_1": "",
      "ah-1.5_2": "",
      "ah-1_1": "",
      "ah-1_2": "",
      "ah0_1": "",
      "ah0_2": "",
      "ah+0.5_1": "",
      "ah+1_1": "",
      "ah+1_2": "",
      "ah+1.5_1": "",
      "ah+1.5_2": "",
      "ah+2_1": "",
      "ah+2_2": "",
      "ah+2.5_1": "",
      "ah+2.5_2": "",
      "ah+3_1": "",
      "ah+3_2": "",
      "ah+3.5_1": "",
      "ah+3.5_2": "",
      "ah+4_1": "",
      "ah+4_2": "",
      "ah+4.5_1": "",
      "ah+4.5_2": "",
      "o+0.5": "",
      "u+0.5": "",
      "o+1": "",
      "u+1": "",
      "o+1.5": "",
      "u+1.5": "",
      "o+2": "",
      "u+2": "",
      "o+2.5": "1.44",
      "u+2.5": "2.60",
      "o+3": "",
      "u+3": "",
      "o+3.5": "2.00",
      "u+3.5": "1.72",
      "o+4": "",
      "u+4": "",
      "o+4.5": "",
      "u+4.5": "",
      "o+5": "",
      "u+5": "",
      "o+5.5": "",
      "u+5.5": "",
      "bts_yes": "1.44",
      "bts_no": "2.60"
    }.with_indifferent_access
  ]
end
