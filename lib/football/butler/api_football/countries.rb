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
          def by_name(name:)
            filters = { name: name }
            Api.get(path: PATH, filters: filters)
          end

          # /countries?code={code}
          def by_code(code:)
            filters = { code: code }
            Api.get(path: PATH, filters: filters)
          end

          ## COUNTRIES
          # /countries
          def all(result:)
            Api.get(path: PATH, result: result)
          end

        end
      end
    end
  end
end
