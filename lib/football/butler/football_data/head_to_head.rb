# frozen_string_literal: true

module Football
  module Butler
    module FootballData
      class HeadToHead < Base
        PATH = :matches

        class << self
          ## HEAD TO HEAD
          #
          # v2/matches/{id}
          def by_match(id:)
            path  = "#{PATH}/#{id}"
            match = Api.get(path: path, result: :parsed_response)

            if match.is_a?(Hash) && match.with_indifferent_access.dig(:head2head)
              match['head2head']
            else
              match
            end
          end
        end
      end
    end
  end
end 
