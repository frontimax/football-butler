# frozen_string_literal: true
require 'football/butler/apifootball/base_apifootball'

module Football
  module Butler
    module Apifootball
      class Players < BaseApifootball
        PATH = :get_players

        class << self
          ## PLAYER
          # action=get_players?player_id={id}
          def by_id(id:)
            filters = { player_id: id }
            Api.get(path: build_path(PATH), filters: filters, result: :parsed_response)
          end

          # action=get_players?name={name}
          def by_name(name:, result:)
            filters = { player_name: name }
            Api.get(path: build_path(PATH), filters: filters, result: result)
          end
        end
      end
    end
  end
end
