# frozen_string_literal: true
require 'football/butler/apifootball/countries'
require 'football/butler/football_data/areas'
require 'football/butler/api_football/countries'

module Football
  module Butler
    class Areas < Base

      class << self
        ## AREA / COUNTRY
        def by_id(id:)
          api_switch_method(__method__, { id: id })
        end

        ## AREAS / COUNTRIES
        def all(result: api_switch_result)
          api_switch_method(__method__, { result: result })
        end

        ## ADDITIONAL
        def by_name(name:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { name: name, result: result, filters: filters })
        end

        def by_code(code:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { code: code, result: result, filters: filters })
        end

        def search_by_name(name:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { name: name, result: result, filters: filters })
        end
      end
    end
  end
end
