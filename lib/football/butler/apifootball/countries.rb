# frozen_string_literal: true

module Football
  module Butler
    module Apifootball
      class Countries < Base
        PATH = :get_countries

        class << self
          ## AREAS
          # action=get_leagues
          def all(result: :default)
            path = "action=#{PATH}"
            Api.get(path: path, result: result)
          end
        end
      end
    end
  end
end
