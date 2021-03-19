# frozen_string_literal: true

module Football
  module Butler
    class Api < Base
      RETRIES = 2

      class << self
        def get(path:, filters: {}, result: :default)
          Configuration.wait_on_limit ?
            get_with_wait(path: path, filters: filters, result: result) :
            get_default(path: path, filters: filters, result: result)
        end

        private

        def get_default(path:, filters: {}, result: :default)
          return invalid_config_result if invalid_config?
          response = process_http_party(path, filters)
          process_response(response, result)
        end

        def get_with_wait(path:, filters: {}, result: :default)
          return invalid_config_result if invalid_config?

          if Tier.limit_exceeded?
            log("Tier.limit_exceeded, sleeping for #{Tier.get_sleep_seconds} seconds now ...")
            sleep(Tier.get_sleep_seconds) unless Rails.env.test?
          end

          response = process_http_party(path, filters)
          Tier.set_from_response_headers(response)

          if reached_limit?(response)
            response = process_retry(path, filters)
          end

          process_response(response, result)
        end

        def process_retry(path, filters)
          response  = nil
          retries   = 0

          while retries <= RETRIES
            retries +=1

            log("Tier.limit_exceeded again (retry #{retries}), sleeping for #{Tier.get_sleep_seconds} seconds now ...")
            sleep(Tier.get_sleep_seconds) unless Rails.env.test?

            response = process_http_party(path, filters)
            Tier.set_from_response_headers(response)

            break unless reached_limit?(response)
          end
          response
        end

        def process_http_party(path, filters)
          headers = {
            "X-Auth-Token": Configuration.api_token
          }
          url   = "#{Configuration.api_endpoint}/#{path}"
          query = filters || {}

          http_party_get(url, headers, query)
        end

        def process_response(response, result)
          if response.dig('message')
            error_message(response['message'])
          else
            case result
            when :default
              response
            else
              response&.keys&.include?(result.to_s) ? response[result.to_s] : nil
            end
          end
        end

        def http_party_get(url, headers, query)
          HTTParty.get "#{url}",
                       headers: headers,
                       query: query,
                       format: :json
        end

        def invalid_config?
          Configuration.api_token.blank? || Configuration.api_endpoint.blank?
        end

        def log(text)
          "\n\nFootball::Butler::VERSION: #{Football::Butler::VERSION} - #{text}\n\n"
        end
      end
    end
  end
end
