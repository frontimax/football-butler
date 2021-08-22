# frozen_string_literal: true

RSpec.describe Football::Butler::Trophies do
  before do
    Football::Butler::Configuration.reconfigure(
      api_endpoint: Football::Butler::Configuration::API_URL_API_FOOTBALL,
      api_name: :api_football_com
    )

    stubs_trophies
  end

  after do
    Football::Butler::Configuration.reset
    Football::Butler::Configuration.reconfigure(api_token: 'my_dummy_token')
  end

  describe 'when by_player' do
    context 'success' do
      it 'returns trophies' do
        response = described_class.by_player(player: 1540)

        expect(response).to be_a(Array)
        expect(response).to match_array(response_trophies)
      end
    end
  end

  describe 'when by_coach' do
    context 'success' do
      it 'returns trophies' do
        response = described_class.by_coach(coach: 1540)

        expect(response).to be_a(Array)
        expect(response).to match_array(response_trophies)
      end
    end
  end
end

def stubs_trophies
  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/trophies?player=1540")
    .to_return(status: 200, body: get_mocked_response('trophies.json', :api_football))

  stub_request(:get, "#{Football::Butler::Configuration.api_endpoint}/trophies?coach=1540")
    .to_return(status: 200, body: get_mocked_response('trophies.json', :api_football))
end

def response_trophies
  [
    {
      "league": "Premyer Liqa",
      "country": "Azerbaijan",
      "season": "2018/2019",
      "place": "Winner"
    }.with_indifferent_access,
    {
      "league": "Premyer Liqa",
      "country": "Azerbaijan",
      "season": "2016/2017",
      "place": "2nd Place"
    }.with_indifferent_access,
    {
      "league": "Cup",
      "country": "Azerbaijan",
      "season": "2016/2017",
      "place": "2nd Place"
    }.with_indifferent_access,
    {
      "league": "Cup",
      "country": "Azerbaijan",
      "season": "2015/2016",
      "place": "2nd Place"
    }.with_indifferent_access,
    {
      "league": "Cup",
      "country": "Azerbaijan",
      "season": "2014/2015",
      "place": "2nd Place"
    }.with_indifferent_access,
    {
      "league": "Cup",
      "country": "Azerbaijan",
      "season": "2013/2014",
      "place": "Winner"
    }.with_indifferent_access,
    {
      "league": "Super Cup",
      "country": "Azerbaijan",
      "season": "2013/2014",
      "place": "2nd Place"
    }.with_indifferent_access,
    {
      "league": "Premyer Liqa",
      "country": "Azerbaijan",
      "season": "2012/2013",
      "place": "Winner"
    }.with_indifferent_access,
    {
      "league": "Cup",
      "country": "Azerbaijan",
      "season": "2012/2013",
      "place": "Winner"
    }.with_indifferent_access,
    {
      "league": "Premyer Liqa",
      "country": "Azerbaijan",
      "season": "2010/2011",
      "place": "Winner"
    }.with_indifferent_access
  ]
end
