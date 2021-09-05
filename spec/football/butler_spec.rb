# frozen_string_literal: true

RSpec.describe Football::Butler do
  before do
    stubs
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'correct release version' do
    it "has a version number" do
      expect(Football::Butler::VERSION).not_to be nil
    end
    
    it "returns current version #{Football::Butler::VERSION}" do
      expect(Football::Butler::VERSION).to eq('2.2.0')
    end
  end

  describe 'when logging' do
    it 'logs' do
      described_class.logger = Logger.new(STDOUT)
      expect(described_class.logger.debug("I am logging")).to be_truthy
    end
  end

  describe 'when get' do
    it 'returns matches' do
      client = described_class.get(path: 'matches')
      expect(client.parsed_response).to include(response_matches_butler)
    end
  end

  describe 'without api token' do
    before do
      Football::Butler::Configuration.reconfigure(api_token: nil)
    end

    it 'returns invalid_config_result' do
      Football::Butler::Configuration.reconfigure(api_token: '')
      response = described_class.get(path: 'matches')

      expect(response[:message]).to eq(Football::Butler::Base::MSG_INVALID_CONFIG)
    end
  end

  describe 'when Configuration.reconfigure' do
    it 'with reconfigure version and endpoint' do
      Football::Butler::Configuration.reconfigure(api_version: 3)

      expect(Football::Butler::Configuration.api_version).to eq(3)
      expect(Football::Butler::Configuration.api_endpoint).to eq("#{Football::Butler::Configuration::DEFAULT_API_URL}/v3")
    end
  end

  describe 'when unsupported endpoint klass' do
    it 'with PredictExactResults' do
      result = Football::Butler::Predictions.by_match(id: 666)

      expect(result).to be_a(Hash)
      expect(result['message']).to eq("The Endpoint 'Predictions' is not supported by this API: football_data_org")
    end
  end
end

def stubs
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/matches")
    .to_return(status: 200, body: get_mocked_response('matches.json', :football_data))
end

def response_matches_butler
  { "count" => 0,
    "filters" => { "dateFrom" => "2021-03-27", "dateTo" => "2021-03-27", "permission" => "TIER_ONE" },
    "matches" => []
  }.with_indifferent_access
end
