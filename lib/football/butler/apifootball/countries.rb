# frozen_string_literal: true

module Football
  module Butler
    module Apifootball
      class Countries < BaseApifootball
        PATH = :get_countries

        class << self
          ## COUNTRIES
          # action=get_leagues
          def all(result: :parsed_response)
            Api.get(path: build_path(PATH), result: result)
          end
        end
      end
    end
  end
end
