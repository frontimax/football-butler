# frozen_string_literal: true
require 'football/butler/apifootball/teams'
require 'football/butler/football_data/teams'
require 'football/butler/api_football/teams'

module Football
  module Butler
    class Teams < Base

      class << self
        ## TEAM
        def by_id(id:)
          api_switch_method(__method__, { id: id })
        end

        def by_name(name:)
          api_switch_method(__method__, { name: name })
        end

        def by_country(country:)
          api_switch_method(__method__, { country: country })
        end

        ## COMPETITION
        def by_competition(id:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { id: id, result: result, filters: filters })
        end

        def by_league(id:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { id: id, result: result, filters: filters })
        end

        def by_competition_and_year(id:, year:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { id: id, year: year, result: result, filters: filters })
        end

        def by_competition_and_season(id:, season:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { id: id, season: season, result: result, filters: filters })
        end
      end
    end
  end
end
