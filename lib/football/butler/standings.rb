# frozen_string_literal: true
require 'football/butler/apifootball/standings'
require 'football/butler/football_data/standings'

module Football
  module Butler
    class Standings < Base

      class << self
        ## STANDINGS
        def by_competition(id:, result: :default, filters: {})
          api_switch.by_competition(id: id, result: result, filters: filters)
        end

        def home_by_competition(id:, result: :default, filters: {})
          api_switch.home_by_competition(id: id, result: result, filters: filters)
        end

        def away_by_competition(id:, result: :default, filters: {})
          api_switch.away_by_competition(id: id, result: result, filters: filters)
        end

        def by_competition_and_year(id:, year:, result: :default, filters: {})
          api_switch.by_competition_and_year(id: id, year: year, result: result, filters: filters)
        end
      end

    end
  end
end
