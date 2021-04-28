# frozen_string_literal: true
require 'football/butler/apifootball/competitions'
require 'football/butler/football_data/competitions'

module Football
  module Butler
    class Competitions < Base

      class << self
        ## COMPETITION
        def by_id(id:)
          api_switch_method(__method__, { id: id })
        end

        ## COMPETITIONS
        # TODO: Configuration.tier_plan_filter?
        # v before: def self.all(result: PATH, filters: Configuration.tier_plan_filter)
        def all(result: api_switch_result, filters: {})
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
      end

    end
  end
end
