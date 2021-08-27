# frozen_string_literal: true

RSpec.describe Football::Butler::Leagues do
  before do
    stubs_competitions
  end

  describe 'when by_id' do
    it 'returns one competition' do
      response = described_class.by_id(id: 2002)

      expect(response).to be_a(HTTParty::Response)
      expect(response.parsed_response).to be_a(Hash)
      expect(response.parsed_response).to include(response_competition.stringify_keys)
    end

    it 'returns one competition' do
      response = Football::Butler::Leagues.by_id(id: 2002)

      expect(response).to be_a(HTTParty::Response)
      expect(response.parsed_response).to be_a(Hash)
      expect(response.parsed_response).to include(response_competition.stringify_keys)
    end
  end

  describe 'when all' do
    it 'returns all competitions' do
      response = described_class.all

      expect(response).to be_a(Array)
      expect(response).to match_array(response_competitions)
    end

    it 'returns all competitions with result param :default' do
      response = described_class.all(result: :default)

      expect(response).to be_a(HTTParty::Response)
      expect(response.parsed_response).to be_a(Hash)
      expect(response.parsed_response).to include(response_competitions_all.stringify_keys)
    end
  end

  describe 'when all_tier_plan_filter' do
    it 'returns all competitions with configured tier plan filter empty' do
      response = described_class.all_tier_plan_filter

      expect(response).to be_a(Array)
      expect(response).to match_array(response_competitions)
    end

    it 'returns all competitions with configured tier plan filter TIER_ONE' do
      Football::Butler::Configuration.reconfigure(
        tier_plan: 'TIER_ONE'
      )
      response = described_class.all_tier_plan_filter

      expect(response).to be_a(Array)
      expect(response).to match_array(response_competitions)
    end
  end

  describe 'when by_plan' do
    it 'returns all competitions TIER_TWO' do
      response = described_class.by_plan(plan: 'TIER_TWO')

      expect(response).to be_a(Array)
      expect(response).to match_array(response_competitions_filter_plan)
    end
  end

  describe 'when by_areas' do
    it 'returns all competitions two areas' do
      response = described_class.by_areas(ids: [2088, 2081])

      expect(response).to be_a(Array)
      expect(response).to match_array(response_competitions_filter_areas)
    end
  end

  describe 'when current_match_day' do
    it 'returns current matchday of bundesliga' do
      response = described_class.current_match_day(id: 2002)
      expect(response).to eq(27)
    end

    it 'returns nothing' do
      response = described_class.current_match_day(id: 9999)
      expect(response.with_indifferent_access).to include(response_missing.stringify_keys)
    end
  end

  describe 'when seasons' do
    it 'returns all seasons of bundesliga' do
      response = described_class.seasons(id: 2001)
      expect(response).to match_array(response_seasons)
    end

    it 'returns nothing' do
      response = described_class.seasons(id: 9999)
      expect(response.with_indifferent_access).to include(response_missing.stringify_keys)
    end
  end
end
