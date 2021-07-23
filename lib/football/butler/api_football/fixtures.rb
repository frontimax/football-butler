# frozen_string_literal: true
require 'football/butler/api_football/base_api_football'

module Football
  module Butler
    module ApiFootball
      class Fixtures < BaseApiFootball
        PATH = :fixtures

        class << self
          ## FIXTURE
          # /fixtures
          def by_id(id:)
            filters = { id: id }
            Api.get(path: PATH, filters: filters)
          end

          ## FIXTURES
          #
          # id
          # integer
          # The id of the fixture
          #
          # live
          # string
          # Enum: "all" "id-id"
          # date
          # stringYYYY-MM-DD
          # A valid date
          #
          # league
          # integer
          # The id of the league
          #
          # season
          # integer 4 characters YYYY
          # The season of the league
          #
          # team
          # integer
          # The id of the team
          #
          # last
          # integer <= 2 characters
          # For the X last fixtures
          #
          # next
          # integer <= 2 characters
          # For the X next fixtures
          #
          # from
          # stringYYYY-MM-DD
          # A valid date
          #
          # to
          # stringYYYY-MM-DD
          # A valid date
          #
          # round
          # string
          # The round of the fixture
          #
          # status
          # string
          # The status short of the fixture
          #
          # timezone
          # string
          # A valid timezone from the endpoint Timezone
          #
          # /fixtures
          #
          # /fixtures?league={id}&season={year}
          def by_competition_and_year(id:, year:, result:, filters:)
            filters.merge!({ league: id, season: year })
            Api.get(path: PATH, filters: filters, result: result)
          end

          # TODO: more new methods, always with season!
          #
          #
        end
      end
    end
  end
end
