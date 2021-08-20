# frozen_string_literal: true

module Football
  module Butler
    module Tier
      COUNTER_RESET_SAFE_SECONDS = 5

      class << self
        attr_accessor :available_minute, :counter_reset, :last_request, :total_requests, :sleep_seconds

        def set_from_response_headers(response)
          case Configuration.api_name
          when :apifootball_com
            # n/a
          when :football_data_org
            if available_minute?(response, 'x-requests-available-minute') &&
              counter_reset?(response, 'x-requestcounter-reset')
              set_tier_from_response(
                response.headers['x-requests-available-minute'],
                response.headers['x-requestcounter-reset']
              )
            end
          when :api_football_com
            if available_minute?(response, 'x-ratelimit-remaining')
              set_tier_from_response(
                response.headers['x-ratelimit-remaining'],
                '60'
              )
            end
          end
        end

        def set_tier_from_response(available_minute, counter_reset)
          @available_minute = available_minute.to_i
          @counter_reset    = counter_reset.to_i
          @last_request     = Time.current

          true
        end

        def available_minute?(response, key_remaining_minute)
          response&.headers&.dig(key_remaining_minute)&.present?
        end

        def counter_reset?(response, key_reset)
          response&.headers&.dig(key_reset)&.present?
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

        def count_request
          @total_requests = @total_requests.is_a?(Integer) ? @total_requests + 1 : 1
        end

        def reset_sleep_seconds
          @sleep_seconds = 0
        end
      end
    end
  end
end