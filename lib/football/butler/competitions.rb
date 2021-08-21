# frozen_string_literal: true
require 'football/butler/apifootball/competitions'
require 'football/butler/football_data/competitions'
require 'football/butler/api_football/leagues'

module Football
  module Butler
    class Competitions < Base

      class << self
        ## COMPETITION
        def by_id(id:)
          api_switch_method(__method__, { id: id })
        end

        def by_country(id:, result: api_switch_result)
          api_switch_method(__method__, { id: id, result: result })
        end

        def by_country_name(name:, result: api_switch_result)
          api_switch_method(__method__, { name: name, result: result })
        end

        ## COMPETITIONS
        def all(result: api_switch_result, filters: {})
          api_switch_method(__method__, { result: result, filters: filters })
        end

        def all_tier_plan_filter(result: api_switch_result, filters: {})
          filters.merge!(Configuration.tier_plan_filter)
          api_switch_method(__method__, { result: result, filters: filters })
        end

        def by_plan(plan:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { plan: plan, result: result, filters: filters })
        end

        def by_areas(ids:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { ids: ids, result: result, filters: filters })
        end

        ## ADDITIONAL
        def current_match_day(id:)
          api_switch_method(__method__, { id: id })
        end

        def seasons(id:)
          api_switch_method(__method__, { id: id })
        end

        def all_seasons(result: api_switch_result)
          api_switch_method(__method__, { result: result })
        end

        def search_by_name(name:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { name: name, result: result, filters: filters })
        end

        def all_leagues(result: api_switch_result, filters: {})
          api_switch_method(__method__, { result: result, filters: filters })
        end

        # /leagues?type=cup
        def all_cups(result: api_switch_result, filters: {})
          api_switch_method(__method__, { result: result, filters: filters })
        end
      end

    end
  end
end
