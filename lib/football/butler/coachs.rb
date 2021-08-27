# frozen_string_literal: true
require 'football/butler/api_football/coachs'

module Football
  module Butler
    class Coachs < Base

      class << self
        ## COACHS
        #
        def by_id(id:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { id: id, result: result, filters: filters })
        end

        def search_by_name(name:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { name: name, result: result, filters: filters })
        end

        def by_team(team:, result: api_switch_result, filters: {})
          api_switch_method(__method__, { team: team, result: result, filters: filters })
        end

      end
    end
  end
end
