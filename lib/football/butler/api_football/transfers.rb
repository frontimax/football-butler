# frozen_string_literal: true
require 'football/butler/api_football/base_api_football'

module Football
  module Butler
    module ApiFootball
      class Transfers < BaseApiFootball
        PATH = :transfers

        class << self
          ## TRANSFERS
          #
          # player
          # integer
          # The id of the player
          #
          # team
          # integer
          # The id of the team
          #
          # /transfers?player={player}
          def by_player(player:, result:, filters:)
            filters.merge!({ player: player })
            Api.get(path: PATH, filters: filters, result: result)
          end

          # /transfers?pteam={team}
          def by_team(team:, result:, filters:)
            filters.merge!({ team: team })
            Api.get(path: PATH, filters: filters, result: result)
          end
        end
      end
    end
  end
end
