# frozen_string_literal: true
require 'football/butler/api_football/venues'

module Football
  module Butler
    class Venues < Base

      class << self
        ## VENUES
        #
        def by_city(city:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { city: city, result: result, filters: filters })
        end

        def by_country(country:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { country: country, result: result, filters: filters })
        end

        def by_name(name:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { name: name, result: result, filters: filters })
        end

        def by_id(id:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { id: id, result: result, filters: filters })
        end

        def search(search:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { search: search, result: result, filters: filters })
        end

      end
    end
  end
end
