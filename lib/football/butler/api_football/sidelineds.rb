# frozen_string_literal: true
require 'football/butler/api_football/base_api_football'

module Football
  module Butler
    module ApiFootball
      class Sidelineds < BaseApiFootball
        PATH = :sidelined

        class << self
          ## SIDELINED
          #
          # player
          # integer
          # The id of the player
          #
          # coach
          # integer
          # The id of the coach
          #
          # /trophies?player={player}
          def by_player(player:, result:, filters:)
            filters.merge!({ player: player })
            Api.get(path: PATH, filters: filters, result: result)
          end

          # /trophies?coach={coach}
          def by_coach(coach:, result:, filters:)
            filters.merge!({ coach: coach })
            Api.get(path: PATH, filters: filters, result: result)
          end

        end
      end
    end
  end
end
