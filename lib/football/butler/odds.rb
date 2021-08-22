# frozen_string_literal: true
require 'football/butler/football_data/odds'
require 'football/butler/apifootball/odds'
require 'football/butler/api_football/odds'

module Football
  module Butler
    class Odds < Base

      class << self
        ## ODDS
        def by_match(id:, from: nil, to: nil)
          api_switch_method(__method__, { id: id, from: from, to: to })
        end
      end
    end
  end
end
