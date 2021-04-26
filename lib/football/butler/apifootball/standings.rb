# frozen_string_literal: true

module Football
  module Butler
    module Apifootball
      class Standings < Base
        PATH = :get_standings

        class << self
          ## STANDINGS / League
          #
          # action=get_standings&league_id={id}
          def by_competition(id:, result:, filters:)
            path = "action=#{PATH}&league_id=#{id}"
            Api.get(path: path)
          end
        end

      end
    end
  end
end
