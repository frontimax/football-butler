# frozen_string_literal: true

module Football
  module Butler
    module Configuration
      # MULTI-API
      API_URL_FOOTBALL_DATA   = 'https://api.football-data.org'
      API_URL_APIFOOTBALL     = 'https://apiv2.apifootball.com/?'
      API_URL_API_FOOTBALL    = 'https://v3.football.api-sports.io'

      API_VERSION_FOOTBALL_DATA = 2
      API_VERSION_APIFOOTBALL   = 2
      API_VERSION_API_FOOTBALL  = 3

      # API
      AVAILABLE_APIS        = [:football_data_org, :apifootball_com, :api_football_com]
      DEFAULT_API_NAME      = :football_data_org
      DEFAULT_API_URL       = API_URL_FOOTBALL_DATA

      DEFAULT_API_TOKEN     = nil
      DEFAULT_API_VERSION   = API_VERSION_FOOTBALL_DATA
      DEFAULT_API_ENDPOINT  = "#{DEFAULT_API_URL}/v#{DEFAULT_API_VERSION}"
      
      # ADDITIONAL
      DEFAULT_TIER_PLAN     = nil
      DEFAULT_WAIT_ON_LIMIT = false

      # MESSAGES
      MSG_REACHED_LIMIT = {
        football_data_org: 'You reached your request limit.', # code: 429
        api_football_com: 'Too many requests. Your rate limit is 10 requests per minute.' # code: 200
      }

      class << self
        attr_accessor :api_version, :api_token, :api_endpoint, :tier_plan, :wait_on_limit, :init_done,
                      :api_name, :header_token_name, :header_additional

        def configure
          raise "You need to configure football-butler first, see readme." unless block_given?

          yield self

          # api_name: AVAILABLE_APIS
          @api_name       = set_api_name(self.api_name)

          @api_token      ||= DEFAULT_API_TOKEN
          @api_version    ||= DEFAULT_API_VERSION
          @api_endpoint   ||= set_api_endpoint(@api_name, @api_version)
          @tier_plan      ||= DEFAULT_TIER_PLAN
          @wait_on_limit  ||= set_wait_on_limit(self.wait_on_limit, @api_name)

          @header_token_name ||= set_header_token_name(@api_name)
          @header_additional ||= {}

          @init_done = true

          api_name_valid?(self.api_name)
        end

        def reconfigure(
          api_token: nil, api_version: nil, api_endpoint: nil, tier_plan: nil, wait_on_limit: nil,
          api_name: nil, header_token_name: nil, header_additional: nil
        )

          reset unless @init_done

          @api_name       = set_api_name(api_name) unless api_name.nil?
          @api_token      = api_token if api_token

          if api_version
            @api_version    = api_version
            @api_endpoint   = set_api_endpoint(@api_name, @api_version) if api_endpoint.nil?
          end

          if api_endpoint.nil?
            @api_endpoint = set_api_endpoint(@api_name, @api_version) if api_name
          else
            @api_endpoint = api_endpoint
          end

          @tier_plan      = tier_plan if tier_plan
          @wait_on_limit  = set_wait_on_limit(wait_on_limit, @api_name) unless wait_on_limit.nil?

          @header_token_name = header_token_name ? header_token_name : set_header_token_name(@api_name)
          @header_additional = header_additional if header_additional

          api_name_valid?(api_name ? api_name : @api_name)
        end

        def api_name_valid?(api_name)
          AVAILABLE_APIS.include?(api_name)
        end

        def reset
          @api_name       = DEFAULT_API_NAME
          @api_version    = DEFAULT_API_VERSION
          @api_endpoint   = DEFAULT_API_ENDPOINT
          @tier_plan      = DEFAULT_TIER_PLAN
          @wait_on_limit  = DEFAULT_WAIT_ON_LIMIT

          @header_token_name = set_header_token_name(@api_name)
          @header_additional = {}

          @init_done = true

          true
        end

        # plan = [ TIER_ONE | TIER_TWO | TIER_THREE | TIER_FOUR ]
        def tier_plan_filter
          tier_plan.nil? ? {} : { plan: tier_plan }
        end

        # [:football_data_org, :apifootball_com]
        # - https://www.football-data.org/documentation/api
        # - https://apifootball.com/documentation
        def api_class
          case api_name
          when :apifootball_com
            'Apifootball'
          when :football_data_org
            'FootballData'
          when :api_football_com
            'ApiFootball'
          end
        end

        def set_api_name(api_name)
          api_name_valid?(api_name) ? api_name : DEFAULT_API_NAME
        end

        def set_api_endpoint(api_name, api_version = DEFAULT_API_VERSION)
          return if api_name.nil?

          case api_name
          when :apifootball_com
            API_URL_APIFOOTBALL
          when :football_data_org
            "#{API_URL_FOOTBALL_DATA}/v#{api_version}"
          when :api_football_com
            API_URL_API_FOOTBALL
          end
        end

        def set_wait_on_limit(wait_on_limit, api_name)
          case api_name
          when :apifootball_com
            false
          when :football_data_org
            wait_on_limit
          when :api_football_com
            wait_on_limit
          end
        end

        def set_header_token_name(api_name)
          case api_name
          when :apifootball_com
            # not used in header
            nil
          when :football_data_org
            "X-Auth-Token"
          when :api_football_com
            "x-apisports-key"
          end
        end

        def http_party_headers
          result = case api_name
                   when :apifootball_com
                    {}
                   when :football_data_org, :api_football_com
                     { Configuration.header_token_name => Configuration.api_token }
                   end

          result.merge!(Configuration.header_additional)
          result
        end

        def http_party_url(path)
          case api_name
          when :apifootball_com
            "#{Configuration.api_endpoint}#{path}&APIkey=#{Configuration.api_token}"
          when :football_data_org
            "#{Configuration.api_endpoint}/#{path}"
          when :api_football_com
            "#{Configuration.api_endpoint}/#{path}"
          end
        end

        def http_party_response(response, result)
          case api_name
          when :apifootball_com
            response_apifootball_com(response, result)
          when :football_data_org
            response_football_data_org(response, result)
          when :api_football_com
            response_api_football_com(response, result)
          end
        end

        def response_apifootball_com(response, result)
          case result
          when :default
            response
          when :array_first
            response.parsed_response.is_a?(Array) ? response.parsed_response.first : nil
          else
            response.parsed_response
          end
        end

        def response_football_data_org(response, result)
          case result
          when :default
            response
          when :parsed_response
            response.parsed_response
          else
            response&.keys&.include?(result.to_s) ? response[result.to_s] : nil
          end
        end

        def response_api_football_com(response, result)
          case result
          when :default
            response
          when :parsed_response
            response.parsed_response
          when :array_first
            response&.keys&.include?('response') && response['response'].is_a?(Array) ?
              response['response'].first : nil
          else
            response&.keys&.include?('response') ? response['response'] : nil
          end
        end

        def api_result(klass)
          case api_name
          when :apifootball_com
            :parsed_response
          when :football_data_org
            klass::PATH
          when :api_football_com
            :response
          end
        rescue
          return nil
        end

        def tier_from_response(response)
          case api_name
          when :apifootball_com
            # n/a
          when :football_data_org, :api_football_com
            Tier.set_from_response_headers(response)
          end
        end

        def class_converter(klass)
          case api_name
          when :apifootball_com
            case klass
            when 'Areas'
              return 'Countries'
            when 'Matches'
              return 'Events'
            when 'Fixtures'
              return 'Events'
            when 'Scorers'
              return 'TopScorers'
            when 'Leagues'
              return 'Competitions'
            end
          when :football_data_org
            case klass
            when 'Countries'
              return 'Areas'
            when 'Events'
              return 'Matches'
            when 'Fixtures'
              return 'Matches'
            when 'TopScorers'
              return 'Scorers'
            when 'Leagues'
              return 'Competitions'
            end
          when :api_football_com
            case klass
            when 'Areas'
              return 'Countries'
            when 'Competitions'
              return 'Leagues'
            when 'Events'
              return 'Fixtures'
            when 'Matches'
              return 'Fixtures'
            when 'Scorers'
              return 'TopScorers'
            end
          end

          klass
        end

        def reached_limit?(response)
          case api_name
          when :apifootball_com
            false
          when :football_data_org
            return false if !response.is_a?(Hash) &&
              (response.respond_to?(:parsed_response) &&
                !response.parsed_response.is_a?(Hash))
            return response.dig('message') ? response['message'].start_with?(MSG_REACHED_LIMIT[api_name]) : false
          when :api_football_com
            if response.is_a?(HTTParty::Response) && response&.headers.present?
              if response.headers['x-ratelimit-remaining'] == '0' ||
                response.headers['x-ratelimit-requests-remaining'] == '0'
                return true
              end
            elsif response.is_a?(HTTParty::Response) && response.parsed_response.dig('errors', 'rateLimit').present?
              return true
            end
          end

          false
        rescue
          return false
        end
      end
    end
  end
end