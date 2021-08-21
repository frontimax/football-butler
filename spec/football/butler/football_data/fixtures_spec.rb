# frozen_string_literal: true

RSpec.describe Football::Butler::Fixtures do
  before do
    stubs_matches
  end

  describe 'when by_id' do
    it 'returns one match' do
      response = described_class.by_id(id: 2002)

      expect(response).to be_a(HTTParty::Response)
      expect(response.parsed_response).to include(response_match.stringify_keys)
    end
  end

  describe 'when all' do
    it 'returns all matches' do
      response = described_class.all

      expect(response).to be_a(Array)
      expect(response).to match_array(response_matches)
    end

    it 'returns all matches with result param :default' do
      response = described_class.all(result: :default)

      expect(response).to be_a(HTTParty::Response)
      expect(response.parsed_response).to be_a(Hash)
      expect(response.parsed_response).to include(response_matches_all.stringify_keys)
    end

    it 'returns all matches with result param :default' do
      response = Football::Butler::Fixtures.all(result: :default)

      expect(response).to be_a(HTTParty::Response)
      expect(response.parsed_response).to be_a(Hash)
      expect(response.parsed_response).to include(response_matches_all.stringify_keys)
    end
  end

  describe 'when by_competition' do
    it 'returns all matches of competition' do
      response = described_class.by_competition(id: 2002)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_matches_more)
    end
  end

  describe 'when by_competition_and_year' do
    it 'returns all matches of competition and season year' do
      response = described_class.by_competition_and_year(id: 2002, year: 2020)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_matches_more)
    end
  end

  describe 'when by_competition_and_match_day' do
    it 'returns all matches of competition and season year' do
      response = described_class.by_competition_and_match_day(id: 2002, match_day: 1)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_matches_more)
    end
  end

  describe 'when by_team' do
    it 'returns all matches of a team' do
      response = described_class.by_team(id: 2002)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_matches_more)
    end
  end

  describe 'when by_team_finished' do
    it 'returns all finished matches of a team' do
      response = described_class.by_team_finished(id: 2002)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_matches_more)
    end
  end

  describe 'when by_team_and_status' do
    it 'returns all scheduled matches of a team' do
      response = described_class.by_team_and_status(
        id: 2002, status: Football::Butler::FootballData::Matches::STATUS_FINISHED
      )

      expect(response).to be_a(Array)
      expect(response).to match_array(response_matches_more)
    end
  end

  describe 'when by_team_scheduled' do
    it 'returns all scheduled matches of a team' do
      response = described_class.by_team_scheduled(id: 2002)

      expect(response).to be_a(Array)
      expect(response).to match_array(response_matches_more)
    end
  end
end
