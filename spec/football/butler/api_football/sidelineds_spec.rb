# frozen_string_literal: true

RSpec.describe Football::Butler::Sidelineds do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_API_FOOTBALL,
      api_name: :api_football_com
    )

    stubs_sidelineds
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_player' do
    context 'success' do
      it 'returns sidelineds' do
        response = described_class.by_player(player: 1)

        expect(response).to be_a(Array)
        expect(response).to match_array(response_sidelineds)
      end
    end
  end

  describe 'when by_coach' do
    context 'success' do
      it 'returns sidelineds' do
        response = described_class.by_coach(coach: 1)

        expect(response).to be_a(Array)
        expect(response).to match_array(response_sidelineds)
      end
    end
  end
end

def stubs_sidelineds
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/sidelined?player=1")
    .to_return(status: 200, body: get_mocked_response('sidelineds.json', :api_football))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/sidelined?coach=1")
    .to_return(status: 200, body: get_mocked_response('sidelineds.json', :api_football))
end

def response_sidelineds
  []
end
