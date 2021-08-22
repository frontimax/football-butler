# frozen_string_literal: true
require 'football/butler/api_football/trophies'

module Football
  module Butler
    class Trophies < Base

      class << self
        ## TROPHIES
        #
        def by_player(player:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { player: player, result: result, filters: filters })
        end

        def by_coach(coach:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { coach: coach, result: result, filters: filters })
        end
      end
    end
  end
end
