# frozen_string_literal: true

module Football
  module Butler
    module FootballData
      class Standings < Base
        PATH = :standings

        STANDING_TYPE_HOME = 'HOME'
        STANDING_TYPE_AWAY = 'AWAY'

        ## STANDINGS
        #
        # season={YEAR}
        # standingType={standingType}
        # standingType: [ TOTAL (default) | HOME | AWAY ]
        #
        # v2/competitions/{id}/standings
        class << self
          def by_competition(id:, result:, filters:)
            path = "#{Competitions::PATH}/#{id}/#{PATH}"
            Api.get(path: path, filters: filters, result: result)
          end

          # v2/competitions/{id}/standings?standingType=HOME
          def home_by_competition(id:, result:, filters:)
            filters.merge!({ standingType: STANDING_TYPE_HOME })
            by_competition(id: id, filters: filters, result: result)
          end

          # v2/competitions/{id}/standings?standingType=AWAY
          def away_by_competition(id:, result:, filters:)
            filters.merge!({ standingType: STANDING_TYPE_AWAY })
            by_competition(id: id, filters: filters, result: result)
          end

          # v2/competitions/{id}/standings
          def by_competition_and_year(id:, year:, result:, filters:)
            path = "#{Competitions::PATH}/#{id}/#{PATH}"
            filters.merge!({ season: year })
            Api.get(path: path, filters: filters, result: result)
          end
        end
      end
    end
  end
end
