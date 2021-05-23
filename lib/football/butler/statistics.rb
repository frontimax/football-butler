# frozen_string_literal: true
require 'football/butler/apifootball/statistics'

module Football
  module Butler
    class Statistics < Base

      class << self
        ## STATISTICS
        def by_match(id:)
          api_switch_method(__method__, { id: id })
        end
      end
    end
  end
end
