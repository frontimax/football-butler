# frozen_string_literal: true
require 'football/butler/apifootball/events'
require 'football/butler/football_data/matches'

module Football
  module Butler
    class Matches < Base
      class << self
        ## MATCH
        def by_id(id:)
          api_switch_method(__method__, { id: id })
        end

        ## MATCHES
        def all(result: api_switch_result, filters: {})
          api_switch_method(__method__, { result: result, filters: filters })
        end

        ## by COMPETITION
        def by_competition(id:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { id: id, result: result, filters: filters })
        end

        def by_competition_and_year(id:, year:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { id: id, year: year, result: result, filters: filters })
        end

        def by_competition_and_match_day(id:, match_day:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { id: id, match_day: match_day, result: result, filters: filters })
        end

        ## by TEAM
        def by_team(id:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { id: id, result: result, filters: filters })
        end

        def by_team_and_status(id:, status:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { id: id, status: status, result: result, filters: filters })
        end

        def by_team_finished(id:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { id: id, result: result, filters: filters })
        end

        def by_team_scheduled(id:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { id: id, result: result, filters: filters })
        end

        ## by PLAYER
        def by_player(id:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { id: id, result: result, filters: filters })
        end
      end
    end
  end
end 
