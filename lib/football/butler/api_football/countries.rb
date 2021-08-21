# frozen_string_literal: true
require 'football/butler/api_football/base_api_football'

module Football
  module Butler
    module ApiFootball
      class Countries < BaseApiFootball
        PATH = :countries

        class << self
          ## COUNTRY
          # /countries?name={name}
          def by_name(name:, result:, filters:)
            filters.merge!({ name: name })
            Api.get(path: PATH, result: result, filters: filters)
          end

          # /countries?code={code}
          def by_code(code:, result:, filters:)
            filters.merge!({ code: code })
            Api.get(path: PATH, result: result, filters: filters)
          end

          ## COUNTRIES
          # /countries
          def all(result:)
            Api.get(path: PATH, result: result)
          end

          # /countries?search={name}
          def search_by_name(name:, result:, filters:)
            filters.merge!({ search: name })
            Api.get(path: PATH, result: result, filters: filters)
          end
        end
      end
    end
  end
end
