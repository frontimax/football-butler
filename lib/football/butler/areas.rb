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
        def by_name(name:)
          api_switch_method(__method__, { name: name })
        end

        # TODO: else API?
        def by_code(code:)
          api_switch_method(__method__, { code: code })
        end
      end
    end
  end
end
