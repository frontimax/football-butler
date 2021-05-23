# frozen_string_literal: true

RSpec.describe Football::Butler::HeadToHead do
  before do
    stubs_head_to_head
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
        expect(response).to include(response_head_to_head.stringify_keys)
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

def stubs_head_to_head
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/matches/2002")
    .to_return(status: 200, body: get_mocked_response('head_to_head.json', :football_data))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/matches/1")
    .to_return(status: 200, body: get_mocked_response('resource_missing.json', :football_data))
end

def response_head_to_head
  {
    "numberOfMatches": 5,
    "totalGoals": 26,
    "homeTeam": {
      "id": 678,
      "name": "AFC Ajax",
      "wins": 5,
      "draws": 0,
      "losses": 0
    }.with_indifferent_access,
    "awayTeam": {
      "id": 1914,
      "name": "FC Emmen",
      "wins": 0,
      "draws": 0,
      "losses": 5
    }.with_indifferent_access
  }.with_indifferent_access
end
