# frozen_string_literal: true
require 'football/butler/api_football/base_api_football'

module Football
  module Butler
    module ApiFootball
      class Teams < BaseApiFootball
        PATH = :teams

        class << self
          ## TEAM
          #
          # /teams/id={id}
          def by_id(id:)
            filters = { id: id }
            Api.get(path: PATH, filters: filters)
          end

          # /teams/id={id}
          def by_name(name:)
            filters = { name: name }
            Api.get(path: PATH, filters: filters)
          end

          # /teams/country={country}
          def by_country_name(name:)
            filters = { country: name }
            Api.get(path: PATH, filters: filters)
          end

          ## TEAMS
          #
          # id
          # integer
          # The id of the team
          #
          # name
          # string
          # The name of the team
          #
          # league
          # integer
          # The id of the league
          #
          # season
          # integer 4 characters YYYY
          # The season of the league
          #
          # country
          # string
          # The country name of the team
          #
          # search
          # string >= 3 characters
          # The name or the country name of the team
          #
          # /teams?league={id}&season={year}
          def by_competition_and_year(id:, year:, result:, filters:)
            filters.merge!({ league: id, season: year })
            Api.get(path: PATH, result: result, filters: filters)
          end

          # /teams?league={id}&season={year}
          def by_competition_and_season(id:, season:, result:, filters:)
            by_competition_and_year(id: id, year: season, result: result, filters: filters)
          end
        end
      end
    end
  end
end
