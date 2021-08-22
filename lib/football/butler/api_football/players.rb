# frozen_string_literal: true
require 'football/butler/api_football/base_api_football'

module Football
  module Butler
    module ApiFootball
      class Players < BaseApiFootball
        PATH = :players

        class << self
          ## PLAYER
          #
          # id
          # integer
          # The id of the player
          #
          # team
          # integer
          # The id of the team
          #
          # league
          # integer
          # The id of the league
          #
          # season
          # integer 4 characters YYYY | Requires the fields Id, League or Team...
          # The season of the league
          #
          # search
          # string >= 4 characters Requires the fields League or Team
          # The name of the player
          #
          # page
          # integer
          # Default: 1
          # Use for the pagination
          #
          # players?id={id}&season={season}
          def by_id_and_season(id:, season:, result:, filters:)
            filters.merge!({ id: id, season: season })
            Api.get(path: PATH, filters: filters, result: result)
          end
        end
      end
    end
  end
end
