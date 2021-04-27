# frozen_string_literal: true

module Football
  module Butler
    module FootballData
      class Competitions < Base
        PATH = :competitions

        class << self
          ## COMPETITION
          # v2/competitions/{id}
          # returns competition object directly as a hash
          def by_id(id:)
            path = "#{PATH}/#{id}"
            Api.get(path: path)
          end

          ## COMPETITIONS
          #
          # areas={AREAS}
          # plan={PLAN}
          #
          # v2/competitions
          # TODO: Configuration.tier_plan_filter?
          def all(result:, filters: Configuration.tier_plan_filter)
            Api.get(path: PATH, result: result, filters: filters)
          end

          # v2/competitions?plan={plan}
          def by_plan(plan:, result:, filters:)
            filters.merge!({ plan: plan })
            Api.get(path: PATH, result: result, filters: filters)
          end

          # v2/competitions?areas={id1, id2, ...}
          def by_areas(ids:, result:, filters:)
            filters.merge!({ areas: ids.join(',') })
            Api.get(path: PATH, result: result, filters: filters)
          end

          ## ADDITIONAL
          # v2/competitions/{id}
          def current_match_day(id:)
            response = by_id(id:id)

            if response.is_a?(Hash) && response.dig('message')
              response
            else
              response['currentSeason']['currentMatchday']
            end
          end

          # v2/competitions/{id}
          def seasons(id:)
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
  end
end
