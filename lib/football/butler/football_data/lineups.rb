# frozen_string_literal: true

module Football
  module Butler
    module FootballData
      class Lineups < Base
        PATH = :matches

        class << self
          ## LINEUPS
          #
          # v2/matches/{id}
          def by_match(id:)
            path  = "#{PATH}/#{id}"
            match = Api.get(path: path, result: :match)

            if match.is_a?(Hash) && match.with_indifferent_access.dig(:homeTeam) &&
              match.with_indifferent_access.dig(:awayTeam)

              lineups = {}
              lineups['homeTeam'] = match['homeTeam']
              lineups['awayTeam'] = match['awayTeam']
              lineups
            else
              match
            end
          end
        end
      end
    end
  end
end 
