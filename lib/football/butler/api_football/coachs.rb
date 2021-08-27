# frozen_string_literal: true
require 'football/butler/api_football/base_api_football'

module Football
  module Butler
    module ApiFootball
      class Coachs < BaseApiFootball
        PATH = :coachs

        class << self
          ## COACHS
          #
          # id
          # integer
          # The id of the coach
          #
          # team
          # integer
          # The id of the team
          #
          # search
          # string >= 3 characters
          # The name of the coach
          #
          # /coachs?id={id}
          def by_id(id:, result:, filters:)
            filters.merge!({ id: id })
            Api.get(path: PATH, result: result, filters: filters)
          end

          # /coachs?search={name}
          def search_by_name(name:, result:, filters:)
            filters.merge!({ search: name })
            Api.get(path: PATH, result: result, filters: filters)
          end

          # /coachs?team={team}
          def by_team(team:, result:, filters:)
            filters.merge!({ team: team })
            Api.get(path: PATH, result: result, filters: filters)
          end
        end
      end
    end
  end
end
