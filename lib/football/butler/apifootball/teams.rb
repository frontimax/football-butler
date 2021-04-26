# frozen_string_literal: true

module Football
  module Butler
    module Apifootball
      class Teams < Base
        PATH = :get_teams

        class << self
          ## TEAM
          # action=get_teams&team_id={id}
          def by_id(id:)
            path = "action=#{PATH}&team_id=#{id}"
            Api.get(path: path)
          end

          ## COMPETITION
          # action=get_teams&league_id={id}
          def by_competition(id:, result:, filters:)
            path = "action=#{PATH}&league_id=#{id}"
            Api.get(path: path, result: :default)
          end
        end

      end
    end
  end
end
