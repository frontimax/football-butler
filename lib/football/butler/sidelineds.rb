# frozen_string_literal: true
require 'football/butler/api_football/sidelineds'

module Football
  module Butler
    class Sidelineds < Base

      class << self
        ## SIDELINEDS
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
