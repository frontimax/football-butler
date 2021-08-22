# frozen_string_literal: true
require 'football/butler/api_football/base_api_football'

module Football
  module Butler
    module ApiFootball
      class Lineups < BaseApiFootball
        PATH = 'fixtures/lineups'

        class << self
          ## LINEUPS
          #
          # fixture
          # required
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
          # type
          # string
          # The type
          #
          # fixtures/lineups?fixture={id}
          def by_match(id:)
            filters = { fixture: id }
            Api.get(path: PATH, filters: filters, result: :response)
          end
        end
      end
    end
  end
end
