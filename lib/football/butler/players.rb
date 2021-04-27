# frozen_string_literal: true
require 'football/butler/apifootball/players'
require 'football/butler/football_data/players'

module Football
  module Butler
    class Players < Base

      class << self
        ## PLAYER
        def by_id(id:, result: api_switch_result)
          api_switch_method(__method__, { id: id, result: result })
        end
      end
    end
  end
end
