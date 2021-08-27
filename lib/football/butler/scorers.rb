# frozen_string_literal: true
require 'football/butler/football_data/scorers'
require 'football/butler/apifootball/top_scorers'
require 'football/butler/api_football/top_scorers'

module Football
  module Butler
    class Scorers < Base

      class << self
        ## SCORER
        def by_competition(id:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { id: id, result: result, filters: filters })
        end

        def by_competition_and_year(id:, year:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { id: id, year: year, result: result, filters: filters })
        end
      end
    end
  end
end
