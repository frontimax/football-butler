# frozen_string_literal: true

RSpec.describe Football::Butler::Timezones do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_API_FOOTBALL,
      api_name: :api_football_com
    )

    stubs_timezones
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_competition_and_year' do
    context 'success' do
      it 'returns scorers' do
        response = described_class.all

        expect(response).to be_a(Array)
        expect(response).to match_array(response_timezones)
      end
    end
  end
end

def stubs_timezones
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/timezone")
    .to_return(status: 200, body: get_mocked_response('timezones.json', :api_football))
end

def response_timezones
  [
    "Africa/Abidjan",
    "Africa/Accra",
    "Africa/Addis_Ababa",
    "Africa/Algiers",
    "Africa/Asmara"
  ]
end
