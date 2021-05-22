# frozen_string_literal: true
require 'football/butler/football_data/scorers'
require 'football/butler/apifootball/top_scorers'

module Football
  module Butler
    class TopScorers < Base

      class << self
        ## SCORER
        def by_competition(id:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { id: id, result: result, filters: filters })
        end
      end
    end
  end
end
