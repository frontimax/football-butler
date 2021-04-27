# frozen_string_literal: true
require 'football/butler/apifootball/base_apifootball'

module Football
  module Butler
    module Apifootball
      class Competitions < BaseApifootball
        PATH = :get_leagues

        class << self
          ## COMPETITION
          # action=get_leagues&country_id={id}
          def self.by_id(id:)
            filters = { country_id: id }
            Api.get(path: build_path(PATH), filters: filters)
          end
        end

      end
    end
  end
end
