# frozen_string_literal: true
require 'football/butler/apifootball/predictions'
require 'football/butler/api_football/predictions'

module Football
  module Butler
    class Predictions < Base

      class << self
        ## PREDICTIONS
        def by_match(id:, filters: {}, result: api_switch_result)
          api_switch_method(__method__, { id: id, filters: filters, result: result })
        end
      end
    end
  end
end
