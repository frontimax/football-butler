# frozen_string_literal: true

module Football
  module Butler
    module FootballData
      class Odds < Base
        PATH = :matches

        class << self
          ## ODDS
          #
          # v2/matches/{id}
          def by_match(id:, from:, to:, result:)
            path  = "#{PATH}/#{id}"
            match = Api.get(path: path, result: :match)

            if match.is_a?(Hash) && match.with_indifferent_access.dig(:odds)
              match['odds']
            else
              match
            end
          end
        end
      end
    end
  end
end 
