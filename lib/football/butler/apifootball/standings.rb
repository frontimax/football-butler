# frozen_string_literal: true

module Football
  module Butler
    module Apifootball
      class Standings < Base

        class << self
          ## STANDINGS / League
          #
          # action=get_standings&league_id={id}
          def by_competition(id:, result:, filters:)
            path = "action=get_standings&league_id=#{id}"
            Api.get(path: path)
          end

          def by_league(id:, result:, filters:)
            by_competition(id: id, result: result, filters: filters)
          end

          ## N/A in this API!
          def home_by_competition(id:, result:, filters:)
            unsupported_api_call
          end

          def away_by_competition(id:, result:, filters:)
            unsupported_api_call
          end

          def by_competition_and_year(id:, year:, result:, filters:)
            unsupported_api_call
          end
        end

      end
    end
  end
end
