# frozen_string_literal: true

module Football
  module Butler
    module FootballData
      class Players < Base
        PATH = :players

        class << self
          ## PLAYER
          # v2/players/{id}
          def by_id(id:)
            path = "#{PATH}/#{id}"
            Api.get(path: path)
          end
        end
      end
    end
  end
end
