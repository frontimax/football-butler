# frozen_string_literal: true

module Football
  module Butler
    class Teams < Base
      PATH = :teams

      ## TEAM
      # v2/teams/{id}
      # returns team object directly as a hash
      def self.by_id(id:)
        path = "#{PATH}/#{id}"
        Api.get(path: path)
      end

      ## COMPETITION
      #
      # season={YEAR}
      # stage={STAGE}
      #
      # v2/competitions/{id}/teams
      def self.by_competition(id:, result: PATH, filters: {})
        path = "#{Competitions::PATH}/#{id}/#{PATH}"
        Api.get(path: path, result: result, filters: filters)
      end

      # v2/competitions/{id}/teams?year={year}
      def self.by_competition_and_year(id:, year:, result: PATH, filters: {})
        path = "#{Competitions::PATH}/#{id}/#{PATH}"
        filters.merge!({ year: year })
        Api.get(path: path, result: result, filters: filters)
      end
    end
  end
end
