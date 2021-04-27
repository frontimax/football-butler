# frozen_string_literal: true
require 'football/butler/apifootball/events'
require 'football/butler/football_data/matches'

module Football
  module Butler
    class Matches < Base
      class << self
        ## MATCH
        def by_id(id:, result: :default)
          api_switch_method(__method__, { id: id, result: result })
        end

        ## MATCHES
        def all(result: :default, filters: {})
          api_switch_method(__method__, { result: result, filters: filters })
        end

        ## by COMPETITION
        def by_competition(id:, result: :default, filters: {})
          api_switch_method(__method__, { id: id, result: result, filters: filters })
        end

        def by_competition_and_year(id:, year:, result: :default, filters: {})
          api_switch_method(__method__, { id: id, year: year, result: result, filters: filters })
        end

        def by_competition_and_match_day(id:, match_day:, result: :default, filters: {})
          api_switch_method(__method__, { id: id, match_day: match_day, result: result, filters: filters })
        end

        ## by TEAM
        def by_team(id:, result: :default, filters: {})
          api_switch_method(__method__, { id: id, result: result, filters: filters })
        end

        def by_team_and_status(id:, status:, result: :default, filters: {})
          api_switch_method(__method__, { id: id, status: status, result: result, filters: filters })
        end

        def by_team_finished(id:, result: :default, filters: {})
          api_switch_method(__method__, { id: id, result: result, filters: filters })
        end

        def by_team_scheduled(id:, result: :default, filters: {})
          api_switch_method(__method__, { id: id, result: result, filters: filters })
        end
      end
    end
  end
end 
