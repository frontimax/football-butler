# frozen_string_literal: true

module Football
  module Butler
    module FootballData
      class Scorers < Base
        PATH = :scorers

        class << self
          ## SCORER
          #
          # limit={LIMIT}
          #
          # /v2/competitions/{id}/scorers
          def by_competition(id:, filters:, result:)
            path = "#{Competitions::PATH}/#{id}/#{PATH}"
            Api.get(path: path, result: result, filters: filters)
          end
        end
      end
    end
  end
end
