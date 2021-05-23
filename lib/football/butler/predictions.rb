# frozen_string_literal: true
require 'football/butler/apifootball/predictions'

module Football
  module Butler
    class Predictions < Base

      class << self
        ## PREDICTIONS
        def by_match(id:, filters: {})
          api_switch_method(__method__, { id: id, filters: filters })
        end
      end
    end
  end
end
