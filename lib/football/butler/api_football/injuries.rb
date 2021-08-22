# frozen_string_literal: true
require 'football/butler/api_football/base_api_football'

module Football
  module Butler
    module ApiFootball
      class Injuries < BaseApiFootball
        PATH = :injuries

        class << self
          ## Injuries
          #
          # league
          # integer
          # The id of the league
          #
          # season
          # integer 4 characters YYYY
          # The season of the league, required with league, team and player parameters
          #
          # fixture
          # integer
          # The id of the fixture
          #
          # team
          # integer
          # The id of the team
          #
          # player
          # integer
          # The id of the player
          #
          # date
          # stringYYYY-MM-DD
          # A valid date
          #
          # timezone
          # string
          # A valid timezone from the endpoint Timezone
          #
          # /injuries?ccompetition={competition}&season={season}
          def by_competition_and_season(competition:, season:, result:, filters:)
            filters.merge!({ league: competition, season: season })
            Api.get(path: PATH, result: result, filters: filters)
          end

          # /injuries?fixture={match}
          def by_match(match:, result:, filters:)
            filters.merge!({ fixture: match })
            Api.get(path: PATH, result: result, filters: filters)
          end

          # /injuries?team={team}&season={season}
          def by_team_and_season(team:, season:, result:, filters:)
            filters.merge!({ team: team, season: season })
            Api.get(path: PATH, result: result, filters: filters)
          end
        end
      end
    end
  end
end
