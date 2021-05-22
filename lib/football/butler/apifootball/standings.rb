# frozen_string_literal: true
require 'football/butler/apifootball/base_apifootball'

module Football
  module Butler
    module Apifootball
      class Standings < BaseApifootball
        PATH = :get_standings

        class << self
          ## STANDINGS / League
          #
          # action=get_standings&league_id={id}
          def by_competition(id:, result: , filters:)
            filters.merge!({ league_id: id })
            Api.get(path: build_path(PATH), result: result, filters: filters)
          end
        end

      end
    end
  end
end
