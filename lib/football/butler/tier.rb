# frozen_string_literal: true

module Football
  module Butler
    module Tier
      COUNTER_RESET_SAFE_SECONDS = 5

      class << self
        attr_accessor :available_minute, :counter_reset, :last_request, :total_requests, :sleep_seconds

        def set_from_response_headers(response)
          if available_minute?(response) && counter_reset?(response)
            set_tier_from_response(
              response.headers['x-requests-available-minute'],
              response.headers['x-requestcounter-reset']
            )
          end
        end

        def set_tier_from_response(available_minute, counter_reset)
          @available_minute = available_minute.to_i
          @counter_reset    = counter_reset.to_i
          @last_request     = Time.current

          @total_requests = @total_requests.is_a?(Integer) ? @total_requests + 1 : 1

          true
        end

        def available_minute?(response)
          response&.headers&.dig('x-requests-available-minute')&.present?
        end

        def counter_reset?(response)
          response&.headers&.dig('x-requestcounter-reset')&.present?
        end

        def get_sleep_seconds
          seconds = @counter_reset.is_a?(Integer) ? @counter_reset : 60
          result  = COUNTER_RESET_SAFE_SECONDS + seconds

          @sleep_seconds = @sleep_seconds.is_a?(Integer) ?
                             @sleep_seconds + result : result

          result
        end

        def limit_exceeded?
          @available_minute == 0 && @last_request >= 1.minute.ago
        end

        def reset_total_requests
          @total_requests = 0
        end

        def reset_sleep_seconds
          @sleep_seconds = 0
        end
      end
    end
  end
end