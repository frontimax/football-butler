# frozen_string_literal: true
require 'football/butler/api_football/timezones'

module Football
  module Butler
    class Timezones < Base

      class << self
        ## TIMEZONE
        def all(result: api_switch_result)
          api_switch_method(__method__, { result: result })
        end
      end
    end
  end
end
