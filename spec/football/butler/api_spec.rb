# frozen_string_literal: true

RSpec.describe Football::Butler::Api do

  before do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')

    stubs_client
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when base functions' do
    context 'with reached_limit?' do
      it 'returns true with football_data_org' do
        response = { message: Football::Butler::Configuration::MSG_REACHED_LIMIT[:football_data_org] }
                     .with_indifferent_access
        expect(described_class.reached_limit?(response)).to be_truthy
      end
    end

    context 'with reached_limit?' do
      before do
        Football::Butler::Configuration.reconfigure(
          api_name: :api_football_com
        )
      end

      it 'returns false by exception with api_football_com' do
        response = { message: Football::Butler::Configuration::MSG_REACHED_LIMIT[:api_football_com] }
                     .with_indifferent_access
        expect(described_class.reached_limit?(response)).to be_falsey
      end
    end

    context 'with reached_limit?' do
      before do
        Football::Butler::Configuration.reconfigure(
          api_name: :apifootball_com
        )
      end

      it 'returns true' do
        response = { message: 'Whatever' }.with_indifferent_access
        expect(described_class.reached_limit?(response)).to be_falsey
      end
    end
  end

  describe 'when tier functions' do
    before do
      Football::Butler::Configuration.configure do |config|
        config.api_token      = 'MY_API_TOKEN'
        config.api_version    = 2
        config.api_endpoint   = Football::Butler::Configuration::DEFAULT_API_ENDPOINT
        config.tier_plan      = 'TIER_ONE'
        config.wait_on_limit  = true
      end
    end

    context 'with config' do
      it 'config is set'do
        expect(Football::Butler::Configuration.api_token).to eq('MY_API_TOKEN')
        expect(Football::Butler::Configuration.api_version).to eq(2)
        expect(Football::Butler::Configuration.api_endpoint).to eq(Football::Butler::Configuration::DEFAULT_API_ENDPOINT)
        expect(Football::Butler::Configuration.tier_plan).to eq('TIER_ONE')
        expect(Football::Butler::Configuration.wait_on_limit).to be_truthy
      end
    end

    context 'with set_from_response_headers' do
      it 'sets tier data' do
        Football::Butler::Areas.by_id(id: 2002)

        expect(Football::Butler::Tier.available_minute).to eq(2)
        expect(Football::Butler::Tier.counter_reset).to eq(29)
      end
    end

    context 'with set_from_response_headers api_football' do
      before do
        Football::Butler::Configuration.reconfigure(
          api_name: :api_football_com,
          wait_on_limit: true
        )
      end

      it 'sets tier data' do
        Football::Butler::Areas.by_name(name: 'Germany')

        expect(Football::Butler::Tier.available_minute).to eq(2)
        expect(Football::Butler::Tier.counter_reset).to eq(60)
      end
    end

    context 'with tier functions' do
      it 'gets sleep seconds' do
        Football::Butler::Areas.by_id(id: 2002)

        expect(Football::Butler::Tier.get_sleep_seconds).to eq(34)
        expect(Football::Butler::Tier.limit_exceeded?).to be_falsey
      end

      it 'gets resets' do
        Football::Butler::Tier.reset_total_requests

        Football::Butler::Areas.by_id(id: 2002)
        expect(Football::Butler::Tier.total_requests).to eq(1)

        Football::Butler::Tier.reset_total_requests
        Football::Butler::Tier.reset_sleep_seconds
        expect(Football::Butler::Tier.total_requests).to eq(0)
      end
    end

    context 'with wait_on_limit' do
      it 'runs thru sleep which is disabled in test env' do
        Football::Butler::Configuration.reset
        Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token', wait_on_limit: true)

        Football::Butler::Tier.last_request = Time.now
        Football::Butler::Tier.available_minute = 0

        response = Football::Butler::Areas.by_id(id: 2002)
        expect(response.parsed_response).to include(response_area.stringify_keys)
      end

      it 'runs thru sleep second condition which is disabled in test env' do
        Football::Butler::Configuration.reset
        Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token', wait_on_limit: true)

        response = Football::Butler::Areas.by_id(id: 9999)
        expect(response[:message]).to eq(Football::Butler::Configuration::MSG_REACHED_LIMIT[:football_data_org])
      end
    end

    context 'with wait_on_limit api_football' do
      it 'runs thru sleep which is disabled in test env' do
        Football::Butler::Configuration.reset
        Football::Butler::Configuration.reconfigure(
          api_token: 'my_dummy_token',
          api_endpoint: Football::Butler::Configuration::API_URL_API_FOOTBALL,
          api_name: :api_football_com,
          wait_on_limit: true
        )

        Football::Butler::Tier.last_request = Time.now
        Football::Butler::Tier.available_minute = 0

        response = Football::Butler::Areas.by_name(name: 'Germany')
        expect(response).to match_array(response_area_api_football)
      end

      it 'runs thru sleep second condition which is disabled in test env' do
        Football::Butler::Configuration.reset
        Football::Butler::Configuration.reconfigure(
          api_token: 'my_dummy_token',
          api_endpoint: Football::Butler::Configuration::API_URL_API_FOOTBALL,
          api_name: :api_football_com,
          wait_on_limit: true
        )

        response = Football::Butler::Areas.by_name(name: 'Absurdistan')
        expect(response[:message]).to eq(Football::Butler::Configuration::MSG_REACHED_LIMIT[:api_football_com])
      end
    end

    context 'with reached_limit? api_football' do
      it 'returns true first case' do
        Football::Butler::Configuration.reset
        Football::Butler::Configuration.reconfigure(
          api_token: 'my_dummy_token',
          api_endpoint: Football::Butler::Configuration::API_URL_API_FOOTBALL,
          api_name: :api_football_com,
          wait_on_limit: true
        )

        Football::Butler::Areas.by_name(name: 'England')
        expect(Football::Butler::Tier.available_minute).to eq(0)
      end

      it 'returns true second case' do
        Football::Butler::Configuration.reset
        Football::Butler::Configuration.reconfigure(
          api_token: 'my_dummy_token',
          api_endpoint: Football::Butler::Configuration::API_URL_API_FOOTBALL,
          api_name: :api_football_com,
          wait_on_limit: true
        )

        Football::Butler::Areas.by_name(name: 'Portugal')
        expect(Football::Butler::Tier.available_minute).to eq(0)
      end
    end
  end
end

def stubs_client
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/areas/2002")
    .to_return(status: 200, body: get_mocked_response('area.json', :football_data),
               headers: {
                 'x-requests-available-minute': 2,
                 'x-requestcounter-reset': 29
               }
    )

  stub_request(:get, "#{Football::Butler::Configuration::API_URL_API_FOOTBALL}/countries?name=Germany")
    .to_return(status: 200, body: get_mocked_response('country.json', :api_football),
               headers: {
                 'x-ratelimit-remaining': 2
               }
    )

  stub_request(:get, "#{Football::Butler::Configuration::API_URL_API_FOOTBALL}/countries?name=England")
    .to_return(status: 200, body: get_mocked_response('country.json', :api_football),
               headers: {
                 'x-ratelimit-remaining': 0,
                 'x-ratelimit-requests-remaining': 0
               }
    )

  stub_request(:get, "#{Football::Butler::Configuration::API_URL_API_FOOTBALL}/countries?name=Portugal")
    .to_return(status: 200, body: get_mocked_response('reached_limit.json', :api_football),
               headers: {}
    )

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/areas/9999")
    .to_return(status: 200, body: get_mocked_response('reached_limit.json', :football_data)
    )

  stub_request(:get, "#{Football::Butler::Configuration::API_URL_API_FOOTBALL}/countries?name=Absurdistan")
    .to_return(status: 200, body: get_mocked_response('reached_limit_message.json', :api_football)
    )

end

def response_area
  {
    "id": 2002,
    "name": "Albania",
    "countryCode": "ALB",
    "ensignUrl": 'null',
    "parentAreaId": 2077,
    "parentArea": "Europe"
  }.with_indifferent_access
end

def response_area_api_football
  [
    {
      "name": "Albania",
      "code": "AL",
      "flag": "https://media.api-sports.io/flags/al.svg"
    }.with_indifferent_access
  ]
end
