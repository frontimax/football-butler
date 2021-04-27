# frozen_string_literal: true
require 'football/butler/apifootball/base_apifootball'

module Football
  module Butler
    module Apifootball
      class Events < BaseApifootball
        PATH = :get_events

        class << self
          ## EVENT
          # action=get_events?match_id={id}
          def by_id(id:, result:)
            filters.merge!({ match_id: id })
            Api.get(path: build_path(PATH), result: result)
          end

          # TODO: NEXT!
          ## EVENTS
          #
          # timezone	Default timezone: Europe/Berlin.
          #    With this filter you can set the timezone where you want to receive the data.
          #    Timezone is in TZ format (exemple: America/New_York). (Optional)
          # from	                   Start date (yyyy-mm-dd)
          # to	                     Stop date (yyyy-mm-dd)
          # country_id	Country ID   if set only leagues from specific country will be returned (Optional)
          # league_id	League ID      if set events from specific league will be returned (Optional)
          # match_id	Match ID       if set only details from specific match will be returned (Optional)
          # team_id	Team ID          if set only details from specific team will be returned (Optional)
          #
          # action=get_events&...<AT LEAST ONE PARAMETER IS REQUIRED!>
          # "error": 201, "message": "Required parameters missing"
          def all(result:, filters:)
            Api.get(path: build_path(PATH), result: result, filters: filters)
          end

          ## by COMPETITION
          # action=get_events?league_id={id}
          def by_competition(id:, result:, filters:)
            filters.merge!({ league_id: id })
            Api.get(path: build_path(PATH), filters: filters, result: result)
          end

          # action=get_events?league_id={id}&from={year}-01-01&{year}-12-31
          def by_competition_and_year(id:, year:, result:, filters:)
            from  = "#{year}-01-01"
            to    = "#{year}-12-31"
            filters.merge!({ from: from, to: to })
            Api.get(path: build_path(PATH), filters: filters, result: result)
          end

          ## by TEAM
          # action=get_events?team_id={id}
          def by_team(id:, result: :parsed_response, filters:)
            filters.merge!({ team_id: id })
            Api.get(path: build_path(PATH), result: result, filters: filters)
          end
        end
      end
    end
  end
end 
