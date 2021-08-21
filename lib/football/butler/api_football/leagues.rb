# frozen_string_literal: true
require 'football/butler/api_football/base_api_football'

module Football
  module Butler
    module ApiFootball
      class Leagues < BaseApiFootball
        PATH = :leagues

        class << self
          ## LEAGUE
          # /leagues?id={id}
          def by_id(id:)
            filters = { id: id }
            Api.get(path: PATH, filters: filters)
          end

          # /leagues?country={country}
          def by_country_name(name:, result:)
            filters = { country: name }
            Api.get(path: PATH, filters: filters, result: result)
          end

          # /leagues/seasons
          def all_seasons(result:)
            path = "#{PATH}/seasons"
            Api.get(path: path, result: result)
          end

          ## LEAGUES
          # https://www.api-football.com/documentation-v3#operation/get-leagues
          #
          # id
          # integer
          # The id of the league
          #
          # name
          # string
          # The name of the league
          #
          # country
          # string
          # The country name of the league
          #
          # code
          # string 2 characters FR, GB, IT…
          # The Alpha2 code of the country
          #
          # season
          # integer 4 characters YYYY
          # The season of the league
          #
          # team
          # integer
          # The id of the team
          #
          # type
          # string
          # Enum: "league" "cup"
          # The type of the league
          #
          # current
          # string
          # Enum: "true" "false"
          # The state of the league
          #
          # search
          # string >= 3 characters
          # The name or the country of the league
          #
          # last
          # integer <= 2 characters
          #
          # /leagues
          def all(result:, filters:)
            Api.get(path: PATH, result: result, filters: filters)
          end

        end

      end
    end
  end
end
