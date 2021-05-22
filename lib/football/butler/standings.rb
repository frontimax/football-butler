# frozen_string_literal: true
require 'football/butler/apifootball/standings'
require 'football/butler/football_data/standings'

module Football
  module Butler
    class Standings < Base

      class << self
        def by_competition(id:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { id: id, result: result, filters: filters })
        end

        def home_by_competition(id:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { id: id, result: result, filters: filters })
        end

        def away_by_competition(id:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { id: id, result: result, filters: filters })
        end

        def by_competition_and_year(id:, year:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { id: id, year: year, result: result, filters: filters })
        end
      end

    end
  end
end
