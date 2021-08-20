# frozen_string_literal: true

RSpec.describe Football::Butler::Configuration do

  describe 'when set_api_endpoint' do
    it 'sets api endpoint football-data' do
      Football::Butler::Configuration.reconfigure(api_version: '3')

      expect(described_class.api_endpoint).to eq('https://api.football-data.org/v3')
    end

    it 'sets api endpoint football-data' do
      Football::Butler::Configuration.reconfigure(api_name: :apifootball_com, api_version: '3')

      expect(described_class.api_endpoint).to eq('https://apiv2.apifootball.com/?')
    end
  end

  describe 'when invalid api_name' do
    it 'sets valid api_name' do
      expect(described_class.reconfigure(api_name: :apifootball_com)).to be_truthy
    end

    it 'sets invalid api_name' do
      expect(described_class.reconfigure(api_name: :marillion_football)).to be_falsey
    end
  end

  describe 'when set_wait_on_limit' do
    it 'with football_data_org' do
      described_class.reconfigure(wait_on_limit: true)
      expect(described_class.wait_on_limit).to be_truthy

      described_class.reconfigure(wait_on_limit: false)
      expect(described_class.wait_on_limit).to be_falsey
    end

    it 'with apifootbal_com only false' do
      described_class.reconfigure(api_name: :apifootball_com, wait_on_limit: true)
      expect(described_class.wait_on_limit).to be_falsey
    end

    it 'with api_footbal_com' do
      described_class.reconfigure(wait_on_limit: true, api_name: :api_football_com)
      expect(described_class.wait_on_limit).to be_truthy

      described_class.reconfigure(wait_on_limit: false, api_name: :api_football_com)
      expect(described_class.wait_on_limit).to be_falsey
    end
  end
end
