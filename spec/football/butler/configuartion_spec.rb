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
end
