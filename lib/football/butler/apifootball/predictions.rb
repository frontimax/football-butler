# frozen_string_literal: true
require 'football/butler/apifootball/base_apifootball'

module Football
  module Butler
    module Apifootball
      class Predictions < BaseApifootball
        PATH = :get_predictions

        class << self
          ## PREDICTIONS
          #
          # from	      Start date (yyyy-mm-dd)
          # to	        Stop date (yyyy-mm-dd)
          # country_id	Country ID - if set only leagues from specific country will be returned (Optional)
          # league_id	  League ID - if set events from specific league will be returned (Optional)
          # match_id	  Match ID - if set only details from specific match will be returned (Optional)
          #
          # get_predictions&match_id={id}
          def by_match(id:, filters:)
            filters.merge!(match_id: id)
            Api.get(path: build_path(PATH), filters: filters, result: :parsed_response)
          end
        end
      end
    end
  end
end
