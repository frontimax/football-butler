# frozen_string_literal: true

module Football
  module Butler
    module ApiFootball
      class HeadToHead < Base
        PATH = 'fixtures/headtohead'

        class << self
          ## HEAD TO HEAD
          #
          # h2h
          # required
          # stringID-ID
          # The ids of the teams
          #
          # date
          # stringYYYY-MM-DD
          # league
          # integer
          # The id of the league
          #
          # season
          # integer 4 characters YYYY
          # The season of the league
          #
          # last
          # integer
          # For the X last fixtures
          #
          # next
          # integer
          # For the X next fixtures
          #
          # from
          # stringYYYY-MM-DD
          # to
          # stringYYYY-MM-DD
          # status
          # string
          # The status short of the fixture
          #
          # timezone
          # string
          # A valid timezone from the endpoint Timezone
          #
          # fixtures/headtohead?h2h={team_id-second_team_id}
          def by_teams(team_id:, second_team_id:, filters:, result:)
            filters.merge!(h2h: "#{team_id}-#{second_team_id}")
            Api.get(path: PATH, filters: filters, result: result)
          end
        end
      end
    end
  end
end 
