# frozen_string_literal: true
require 'football/butler/api_football/base_api_football'

module Football
  module Butler
    module ApiFootball
      class Venues < BaseApiFootball
        PATH = :venues

        class << self
          ## VENUES
          #
          # id
          # integer
          # The id of the venue
          #
          # name
          # string
          # The name of the venue
          #
          # city
          # string
          # The city of the venue
          #
          # country
          # string
          # The country name of the venue
          #
          # search
          # string >= 3 characters
          # The name, city or the country of the venue
          #
          # /venues?city={city}
          def by_city(city:, result:, filters:)
            filters.merge!({city: city})
            Api.get(path: PATH, result: result, filters: filters)
          end

          # /venues?country={country}
          def by_country(country:, result:, filters:)
            filters.merge!({country: country})
            Api.get(path: PATH, result: result, filters: filters)
          end

          # /venues?name={name}
          def by_name(name:, result:, filters:)
            filters.merge!({name: name})
            Api.get(path: PATH, result: result, filters: filters)
          end

          # /venues?id={id}
          def by_id(id:, result:, filters:)
            filters.merge!({id: id})
            Api.get(path: PATH, result: result, filters: filters)
          end

          # /venues?search={search}
          def search(search:, result:, filters:)
            filters.merge!({search: search})
            Api.get(path: PATH, result: result, filters: filters)
          end
        end
      end
    end
  end
end
