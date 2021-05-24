# frozen_string_literal: true
require 'football/butler/apifootball/base_apifootball'

module Football
  module Butler
    module Apifootball
      class HeadToHead < BaseApifootball
        PATH = :get_H2H

        class << self
          ## HEAD TO HEAD
          #
          # timezone	    Default timezone: Europe/Berlin. With this filter you can set the timezone
          #               where you want to receive the data. Timezone is in TZ format (exemple: America/New_York).
          #               (Optional)
          # firstTeam	    First team name
          # secondTeam	  Second team name
          # firstTeamId	  First team Id
          # secondTeamId	Second team Id
          #
          # action=get_H2H&firstTeamId={team_id}&secondTeamId={second_team_id}
          def by_teams(team_id:, second_team_id:, filters:, result:)
            filters.merge!(firstTeamId: team_id, secondTeamId: second_team_id)
            Api.get(path: build_path(PATH), filters: filters, result: result)
          end
        end
      end
    end
  end
end
