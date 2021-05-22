# frozen_string_literal: true

RSpec.describe Football::Butler::Players do
  before do
    stubs_player
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_id' do
    it 'returns one player' do
      response = described_class.by_id(id: 2002)

      expect(response.parsed_response).to be_a(Hash)
      expect(response.parsed_response).to include(response_player.stringify_keys)
    end
  end

  describe 'when by_name' do
    it 'returns one player' do
      response = described_class.by_name(name: 'Ronaldo')

      expect(response).to be_a(Hash)
      expect(response['message']).to eq('This method is not supported by this API: football_data_org')
    end
  end
end

def stubs_player
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/players/2002")
    .to_return(status: 200, body: get_mocked_response('player.json', :football_data))
end

def response_player
  {
    "id": 44,
    "name": "Cristiano Ronaldo",
    "firstName": "Cristiano Ronaldo",
    "lastName": "null",
    "dateOfBirth": "1985-02-05",
    "countryOfBirth": "Portugal",
    "nationality": "Portugal",
    "position": "Attacker",
    "shirtNumber": "null",
    "lastUpdated": "2020-11-26T02:19:40Z"
  }
end
