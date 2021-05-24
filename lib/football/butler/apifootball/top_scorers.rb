# frozen_string_literal: true
require 'football/butler/apifootball/base_apifootball'

module Football
  module Butler
    module Apifootball
      class TopScorers < BaseApifootball
        PATH = :get_topscorers

        class << self
          ## TOP SCORER
          #
          # action=get_topscorers?league_id={id}
          def by_competition(id:, result:, filters:)
            filters.merge!({ league_id: id })
            Api.get(path: build_path(PATH), filters: filters, result: result)
          end
        end
      end
    end
  end
end
