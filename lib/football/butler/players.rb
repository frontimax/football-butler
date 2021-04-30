# frozen_string_literal: true
require 'football/butler/apifootball/players'
require 'football/butler/football_data/players'

module Football
  module Butler
    class Players < Base

      class << self
        ## PLAYER
        def by_id(id:)
          api_switch_method(__method__, { id: id })
        end

        def by_name(name:)
          api_switch_method(__method__, { name: name })
        end
      end
    end
  end
end
