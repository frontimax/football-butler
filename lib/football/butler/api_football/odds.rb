# frozen_string_literal: true
require 'football/butler/api_football/base_api_football'

module Football
  module Butler
    module ApiFootball
      class Odds < BaseApiFootball
        PATH = :odds

        class << self
          ## ODDS
          #
          # fixture
          # integer
          # The id of the fixture
          #
          # league
          # integer
          # The id of the league
          #
          # season
          # integer 4 characters YYYY
          # The season of the league
          #
          # date
          # stringYYYY-MM-DD
          # A valid date
          #
          # timezone
          # string
          # A valid timezone from the endpoint Timezone
          #
          # page
          # integer
          # Default: 1
          # Use for the pagination
          #
          # bookmaker
          # integer
          # The id of the bookmaker
          #
          # bet
          # integer
          # The id of the bet
          #
          # odds&match_id={id}&from={from}&to={to}
          def by_match(id:, from:, to:, result:)
            filters = { fixture: id }
            Api.get(path: PATH, filters: filters, result: result)
          end
        end
      end
    end
  end
end
