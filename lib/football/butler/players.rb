# frozen_string_literal: true
require 'football/butler/apifootball/players'
require 'football/butler/football_data/players'
require 'football/butler/api_football/players'

module Football
  module Butler
    class Players < Base

      class << self
        ## PLAYER
        def by_id(id:)
          api_switch_method(__method__, { id: id })
        end

        def by_name(name:, result: api_switch_result)
          api_switch_method(__method__, { name: name, result: result })
        end

        def by_id_and_season(id:, season:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { id: id, season: season, result: result, filters: filters })
        end
      end
    end
  end
end
