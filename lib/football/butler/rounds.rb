# frozen_string_literal: true
require 'football/butler/api_football/rounds'

module Football
  module Butler
    class Rounds < Base

      class << self
        ## ROUNDS
        def all_by_competition_and_season(id:, season:, result: api_switch_result)
          api_switch_method(__method__, { id: id, season: season, result: result })
        end

        def current_by_competition_and_season(id:, season:, result: api_switch_result)
          api_switch_method(__method__, { id: id, season: season, result: result })
        end
      end
    end
  end
end
