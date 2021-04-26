# frozen_string_literal: true

module Football
  module Butler
    module Apifootball
      class Competitions < Base
        PATH = :get_leagues

        class << self
          ## COMPETITION
          # action=get_leagues&country_id={id}
          def self.by_id(id:)
            path = "action=#{PATH}&country_id=#{id}"
            Api.get(path: path)
          end
        end

      end
    end
  end
end
