# frozen_string_literal: true

module Football
  module Butler
    module Apifootball
      class Standings < BaseApifootball
        PATH = :get_standings

        class << self
          ## STANDINGS / League
          #
          # action=get_standings&league_id={id}
          def by_competition(id:, result: :parsed_response, filters:)
            filters.merge!({ league_id: id })
            Api.get(path: build_path(PATH), result: result, filters: filters)
          end
        end

      end
    end
  end
end
