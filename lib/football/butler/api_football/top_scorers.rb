# frozen_string_literal: true
require 'football/butler/api_football/base_api_football'

module Football
  module Butler
    module ApiFootball
      class TopScorers < BaseApiFootball
        PATH = 'players/topscorers'

        class << self
          ## TOP SCORER
          #
          # /players/topscorers?league={id}&season={year}
          def by_competition_and_year(id:, year:, result:, filters:)
            filters.merge!({ league: id, season: year })
            Api.get(path: PATH, filters: filters, result: result)
          end
        end
      end
    end
  end
end
