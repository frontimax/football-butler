# frozen_string_literal: true
require 'football/butler/api_football/injuries'

module Football
  module Butler
    class Injuries < Base

      class << self
        ## INJURIES
        #
        def by_competition_and_season(competition:, season:, result: api_switch_result, filters: {})
          api_switch_method(__method__, {
            competition: competition, season: season, result: result, filters: filters
          })
        end

        def by_match(match:, result: api_switch_result, filters: {})
          api_switch_method(__method__, {
            match: match, result: result, filters: filters
          })
        end

        def by_team_and_season(team:, season:, result: api_switch_result, filters: {})
          api_switch_method(__method__, {
            team: team, season: season, result: result, filters: filters
          })
        end
      end
    end
  end
end
