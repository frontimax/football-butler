# frozen_string_literal: true
require 'football/butler/api_football/base_api_football'

module Football
  module Butler
    module ApiFootball
      class Rounds < BaseApiFootball
        PATH = 'fixtures/rounds'

        class << self
          ## Rounds
          #
          # league
          # required
          # integer
          # The id of the league
          #
          # season
          # required
          # integer 4 characters YYYY
          # The season of the league
          #
          # current
          # boolean
          # Enum: "true" "false"
          # The current round only
          #
          # /fixtures/rounds?league={id}&season={season}
          def all_by_competition_and_season(id:, season:, result:)
            filters = { league: id, season: season }
            Api.get(path: PATH, result: result, filters: filters)
          end

          def current_by_competition_and_season(id:, season:, result:)
            filters= { league: id, season: season, current: true }
            Api.get(path: PATH, result: result, filters: filters)
          end
        end
      end
    end
  end
end
