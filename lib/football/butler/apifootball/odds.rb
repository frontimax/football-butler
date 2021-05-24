# frozen_string_literal: true
require 'football/butler/apifootball/base_apifootball'

module Football
  module Butler
    module Apifootball
      class Odds < BaseApifootball
        PATH = :get_odds

        class << self
          ## ODDS
          #
          # from	Start date (yyyy-mm-dd)
          # to	  Stop date (yyyy-mm-dd)
          #
          # action=get_odds&match_id={id}&from={from}&to={to}
          def by_match(id:, from:, to:)
            filters = { match_id: id, from: from, to: to }
            Api.get(path: build_path(PATH), filters: filters, result: :parsed_response)
          end
        end
      end
    end
  end
end
