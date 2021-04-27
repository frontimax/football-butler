# frozen_string_literal: true

module Football
  module Butler
    module Apifootball
      class Teams < BaseApifootball
        PATH = :get_teams

        class << self
          ## TEAM
          # action=get_teams&team_id={id}
          def by_id(id:)
            filters= { team_id: id }
            Api.get(path: build_path(PATH), filters: filters)
          end

          ## COMPETITION
          # action=get_teams&league_id={id}
          def by_competition(id:, result: :parsed_response, filters:)
            filters.merge!({ league_id: id })
            Api.get(path: build_path(PATH), result: result, filters: filters)
          end
        end

      end
    end
  end
end
