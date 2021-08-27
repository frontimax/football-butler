# frozen_string_literal: true
require 'football/butler/football_data/lineups'
require 'football/butler/apifootball/lineups'
require 'football/butler/api_football/lineups'

module Football
  module Butler
    class Lineups < Base

      class << self
        ## LINEUPS
        def by_match(id:)
          api_switch_method(__method__, { id: id })
        end
      end
    end
  end
end
