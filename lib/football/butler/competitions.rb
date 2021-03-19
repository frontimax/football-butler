# frozen_string_literal: true

module Football
  module Butler
    class Competitions < Base
      PATH = :competitions

      ## COMPETITION
      # v2/competitions/{id}
      # returns competition object directly as a hash
      def self.by_id(id:)
        path = "#{PATH}/#{id}"
        Api.get(path: path)
      end

      ## COMPETITIONS
      #
      # areas={AREAS}
      # plan={PLAN}
      #
      # v2/competitions
      def self.all(result: PATH, filters: Configuration.tier_plan_filter)
        Api.get(path: PATH, result: result, filters: filters)
      end

      # v2/competitions?plan={plan}
      def self.by_plan(plan:, result: PATH, filters: {})
        filters.merge!({ plan: plan })
        Api.get(path: PATH, result: result, filters: filters)
      end

      # v2/competitions?areas={id1, id2, ...}
      def self.by_areas(ids:, result: PATH, filters: {})
        filters.merge!({ areas: ids.join(',') })
        Api.get(path: PATH, result: result, filters: filters)
      end

      ## ADDITIONAL
      # v2/competitions/{id}
      def self.current_match_day(id:)
        response = by_id(id:id)

        if response.is_a?(Hash) && response.dig('message')
          response
        else
          response['currentSeason']['currentMatchday']
        end
      end

      # v2/competitions/{id}
      def self.seasons(id:)
        response = by_id(id:id)

        if response.is_a?(Hash) && response.dig('message')
          response
        else
          response['seasons']
        end
      end
    end
  end
end
