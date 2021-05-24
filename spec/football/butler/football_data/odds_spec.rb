# frozen_string_literal: true

RSpec.describe Football::Butler::Odds do
  before do
    stubs_odds
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_match' do
    context 'success' do
      it 'returns odd' do
        response = described_class.by_match(id: 2002)

        expect(response).to be_a(Hash)
        expect(response).to include(response_odds.stringify_keys)
      end
    end

    context 'error' do
      it 'returns odd' do
        response = described_class.by_match(id: 1)

        expect(response).to be_a(Hash)
        expect(response['message']).to eq("The resource you are looking for does not exist.")
      end
    end
  end
end

def stubs_odds
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/matches/2002")
    .to_return(status: 200, body: get_mocked_response('odds.json', :football_data))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/matches/1")
    .to_return(status: 200, body: get_mocked_response('resource_missing.json', :football_data))
end

def response_odds
  {
    "msg": "Activate Odds-Package in User-Panel to retrieve odds."
  }.with_indifferent_access
end
