# frozen_string_literal: true
require 'football/butler/apifootball/competitions'
require 'football/butler/football_data/competitions'

module Football
  module Butler
    class Competitions < Base

      class << self
        ## COMPETITION
        def self.by_id(id:)
          api_switch_method(__method__, { id: id })
        end

        ## COMPETITIONS
        def self.all(result:, filters:)
          api_switch_method(__method__, { result: result, filters: filters })
        end

        def self.by_plan(plan:, result:, filters:)
          api_switch_method(__method__, { plan: plan, result: result, filters: filters })
        end

        def self.by_areas(ids:, result:, filters:)
          api_switch_method(__method__, { id: id, result: result, filters: filters })
        end

        ## ADDITIONAL
        def self.current_match_day(id:)
          api_switch_method(__method__, { id: id })
        end

        def self.seasons(id:)
          api_switch_method(__method__, { id: id })
        end
      end

    end
  end
end
