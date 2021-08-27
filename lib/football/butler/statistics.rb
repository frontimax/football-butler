# frozen_string_literal: true
require 'football/butler/apifootball/statistics'
require 'football/butler/api_football/statistics'

module Football
  module Butler
    class Statistics < Base

      class << self
        ## STATISTICS
        def by_match(id:, result: api_switch_result)
          api_switch_method(__method__, { id: id, result: result })
        end
      end
    end
  end
end
