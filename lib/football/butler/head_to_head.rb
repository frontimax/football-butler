# frozen_string_literal: true
require 'football/butler/football_data/head_to_head'
require 'football/butler/apifootball/head_to_head'

module Football
  module Butler
    class HeadToHead < Base

      class << self
        ## HEAD TO HEAD
        def by_match(id:)
          api_switch_method(__method__, { id: id })
        end

        def by_teams(team_id:, second_team_id:, filters: {}, result: api_switch_result)
          api_switch_method(__method__, {
              team_id: team_id,
              second_team_id: second_team_id,
              filters: filters,
              result: result
            }
          )
        end
      end
    end
  end
end
