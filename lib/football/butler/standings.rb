# frozen_string_literal: true

module Football
  module Butler
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
      def self.by_competition(id:, result: PATH, filters: {})
        path = "#{Competitions::PATH}/#{id}/#{PATH}"
        Api.get(path: path, filters: filters, result: result)
      end

      # v2/competitions/{id}/standings?standingType=HOME
      def self.home_by_competition(id:, result: PATH, filters: {})
        filters.merge!({ standingType: STANDING_TYPE_HOME })
        by_competition(id: id, filters: filters, result: result)
      end

      # v2/competitions/{id}/standings?standingType=AWAY
      def self.away_by_competition(id:, result: PATH, filters: {})
        filters.merge!({ standingType: STANDING_TYPE_AWAY })
        by_competition(id: id, filters: filters, result: result)
      end

      # v2/competitions/{id}/standings
      def self.by_competition_and_year(id:, year:, result: PATH, filters: {})
        path = "#{Competitions::PATH}/#{id}/#{PATH}"
        filters.merge!({ season: year })
        Api.get(path: path, filters: filters, result: result)
      end
    end
  end
end
