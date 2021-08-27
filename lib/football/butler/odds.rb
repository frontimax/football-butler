# frozen_string_literal: true
require 'football/butler/football_data/odds'
require 'football/butler/apifootball/odds'
require 'football/butler/api_football/odds'

module Football
  module Butler
    class Odds < Base

      class << self
        ## ODDS
        def by_match(id:, from: nil, to: nil, result: api_switch_result)
          api_switch_method(__method__, { id: id, from: from, to: to, result: result })
        end
      end
    end
  end
end
