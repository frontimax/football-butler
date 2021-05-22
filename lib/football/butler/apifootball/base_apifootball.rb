# frozen_string_literal: true

module Football
  module Butler
    module Apifootball
      class BaseApifootball < Base

        class << self
          def build_path(action)
            "action=#{action}"
          end
        end

      end
    end
  end
end
