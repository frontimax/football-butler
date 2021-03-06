# frozen_string_literal: true

module Football
  module Butler
    module FootballData
      class Areas < Base
        PATH = :areas

        class << self
          ## AREA
          # v2/areas/{id}
          # returns area object directly as a hash
          def by_id(id:)
            path = "#{PATH}/#{id}"
            Api.get(path: path)
          end

          ## AREAS
          # v2/areas
          def all(result:)
            Api.get(path: PATH, result: result)
          end

          ## ADDITIONAL
          # v2/areas
          # v2/areas/{id}
          # returns area object directly as a hash
          def by_name(name:, result:, filters:)
            areas = all(result: PATH)
            return areas if areas.is_a?(Hash) && areas.with_indifferent_access.dig('message')
            area  = areas&.detect { |area| area['name'] == name }
            return not_found_result(name) unless area

            by_id(id: area['id'])
          end
        end
      end
    end
  end
end
