# frozen_string_literal: true

module Football
  module Butler
    module FootballData
      class Matches < Base
        PATH              = :matches
        STATUS_SCHEDULED  = 'SCHEDULED'
        STATUS_FINISHED   = 'FINISHED'

        class << self
          ## MATCH
          # v2/matches/{id}
          # returns ["head2head", "match"]
          def by_id(id:)
            path = "#{PATH}/#{id}"
            Api.get(path: path)
          end

          ## MATCHES
          #
          # competitions={competitionIds}
          # dateFrom={DATE}
          # dateTo={DATE}
          # status={STATUS}
          #
          # /v2/matches
          def all(result:, filters:)
            Api.get(path: PATH, result: result, filters: filters)
          end

          ## by COMPETITION
          #
          # dateFrom={DATE}
          # dateTo={DATE}
          # stage={STAGE}
          # status={STATUS}
          # matchday={MATCHDAY}
          # group={GROUP}
          # season={YEAR}
          #
          # v2/competitions/{id}/matches
          def by_competition(id:, result:, filters:)
            path = "#{Competitions::PATH}/#{id}/#{PATH}"
            Api.get(path: path, filters: filters, result: result)
          end

          # v2/competitions/{id}/matches?season={year}
          def by_competition_and_year(id:, year:, result:, filters:)
            path = "#{Competitions::PATH}/#{id}/#{PATH}"
            filters.merge!({ season: year })
            Api.get(path: path, filters: filters, result: result)
          end

          # v2/competitions/{id}/matches?matchday={match_day}
          def by_competition_and_match_day(id:, match_day:, result:, filters:)
            path = "#{Competitions::PATH}/#{id}/#{PATH}"
            filters.merge!({ matchday: match_day })
            Api.get(path: path, filters: filters, result: result)
          end

          ## by TEAM
          #
          # dateFrom={DATE}
          # dateTo={DATE}
          # status={STATUS}
          # venue={VENUE}
          # limit={LIMIT}
          #
          # v2/teams/{id}/matches
          def by_team(id:, result:, filters:)
            path = "#{Teams::PATH}/#{id}/#{PATH}"
            Api.get(path: path, result: result, filters: filters)
          end

          # v2/teams/{id}/matches?status={status}
          def by_team_and_status(id:, status:, result:, filters:)
            path = "#{Teams::PATH}/#{id}/#{PATH}"
            filters.merge!({ status: status })
            Api.get(path: path, result: result, filters: filters)
          end

          # v2/teams/{team}/matches?status=FINISHED
          def by_team_finished(id:, result:, filters:)
            by_team_and_status(id: id, status: STATUS_FINISHED, result: result, filters: filters)
          end

          # v2/teams/{team}/matches?status=SCHEDULED
          def by_team_scheduled(id:, result:, filters:)
            by_team_and_status(id: id, status: STATUS_SCHEDULED, result: result, filters: filters)
          end

          ## PLAYER
          #
          # dateFrom={DATE}
          # dateTo={DATE}
          # status={STATUS}
          # competitions={competitionIds}
          # limit={LIMIT}
          #
          # /v2/players/{id}/matches
          def by_player(id:, result:, filters:)
            path = "#{Players::PATH}/#{id}/#{PATH}"
            Api.get(path: path, result: result, filters: filters)
          end
        end
      end
    end
  end
end 
