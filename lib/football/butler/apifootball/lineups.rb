# frozen_string_literal: true
require 'football/butler/apifootball/base_apifootball'

module Football
  module Butler
    module Apifootball
      class Lineups < BaseApifootball
        PATH = :get_lineups

        class << self
          ## LINEUPS
          #
          # action=get_lineups&match_id={id}
          def by_match(id:)
            filters = { match_id: id }
            Api.get(path: build_path(PATH), filters: filters, result: :parsed_response)
          end
        end
      end
    end
  end
end
