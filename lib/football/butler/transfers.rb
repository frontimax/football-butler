# frozen_string_literal: true
require 'football/butler/api_football/transfers'

module Football
  module Butler
    class Transfers < Base

      class << self
        ## TRANSFERS
        #
        def by_player(player:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { player: player, result: result, filters: filters })
        end

        def by_team(team:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { team: team, result: result, filters: filters })
        end
      end
    end
  end
end
