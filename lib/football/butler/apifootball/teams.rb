# frozen_string_literal: true
require 'football/butler/apifootball/base_apifootball'

module Football
  module Butler
    module Apifootball
      class Teams < BaseApifootball
        PATH = :get_teams

        class << self
          ## TEAM
          # action=get_teams&team_id={id}
          def by_id(id:)
            filters = { team_id: id }
            Api.get(path: build_path(PATH), filters: filters, result: :parsed_response)
          end

          ## COMPETITION
          # action=get_teams&league_id={id}
          def by_competition(id:, result:, filters:)
            filters.merge!({ league_id: id })
            Api.get(path: build_path(PATH), result: result, filters: filters)
          end
        end

      end
    end
  end
end
