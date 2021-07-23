# frozen_string_literal: true
require 'football/butler/api_football/base_api_football'

module Football
  module Butler
    module ApiFootball
      class Standings < BaseApiFootball
        PATH = :standings

        class << self
          ## STANDINGS
          #
          # league
          # integer
          # The id of the league
          #
          # season
          # required
          # integer 4 characters YYYY
          # The season of the league
          #
          # team
          # integer
          # The id of the team
          #
          # /standings?league={id}&season={year}
          def by_competition_and_year(id:, year:, result:, filters:)
            filters.merge!({ league: id, season: year })
            Api.get(path: PATH, filters: filters, result: result)
          end
        end
      end
    end
  end
end
