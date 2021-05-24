# frozen_string_literal: true
require 'football/butler/apifootball/base_apifootball'

module Football
  module Butler
    module Apifootball
      class Competitions < BaseApifootball
        PATH = :get_leagues

        class << self
          ## COMPETITION
          # action=get_leagues&country_id={id}
          def by_country(id:)
            filters = { country_id: id }
            Api.get(path: build_path(PATH), filters: filters)
          end

          ## COMPETITIONS
          #
          # country_id    Country ID - if set only leagues from specific country will be returned (Optional)
          #
          # action=get_league
          def all(result:, filters:)
            Api.get(path: build_path(PATH), result: result, filters: filters)
          end
        end
      end
    end
  end
end
