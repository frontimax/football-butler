# frozen_string_literal: true

module Football
  module Butler
    module Configuration
      # MULTI-API
      API_URL_FOOTBALL_DATA = 'https://api.football-data.org'
      API_URL_APIFOOTBALL   = 'https://apiv2.apifootball.com/?'

      API_VERSION_FOOTBALL_DATA = 2
      API_VERSION_APIFOOTBALL   = 2

      # API
      AVAILABLE_APIS        = [:football_data_org, :apifootball_com]
      DEFAULT_API_NAME      = :football_data_org
      DEFAULT_API_URL       = API_URL_FOOTBALL_DATA

      DEFAULT_API_TOKEN     = nil
      DEFAULT_API_VERSION   = API_VERSION_FOOTBALL_DATA
      DEFAULT_API_ENDPOINT  = "#{DEFAULT_API_URL}/v#{DEFAULT_API_VERSION}"
      
      # ADDITIONAL
      DEFAULT_TIER_PLAN     = nil
      DEFAULT_WAIT_ON_LIMIT = false

      class << self
        attr_accessor :api_version, :api_token, :api_endpoint, :tier_plan, :wait_on_limit, :init_done,
                      :api_name

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

          @init_done = true

          api_name_valid?(self.api_name)
        end

        def reconfigure(
          api_token: nil, api_version: nil, api_endpoint: nil, tier_plan: nil, wait_on_limit: nil,
          api_name: nil
        )

          reset unless @init_done

          @api_name       = set_api_name(api_name) unless api_name.nil?
          @api_token      = api_token unless api_token.nil?

          unless api_version.nil?
            @api_version    = api_version
            @api_endpoint   = set_api_endpoint(@api_name, @api_version) if api_endpoint.nil?
          end

          if api_endpoint.nil?
            @api_endpoint = set_api_endpoint(@api_name, @api_version) if api_name
          else
            @api_endpoint = api_endpoint
          end

          @tier_plan      = tier_plan unless tier_plan.nil?
          @wait_on_limit  = set_wait_on_limit(wait_on_limit, @api_name) unless wait_on_limit.nil?

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
          end
        end

        def set_wait_on_limit(wait_on_limit, api_name)
          case api_name
          when :apifootball_com
            false
          when :football_data_org
            wait_on_limit
          end
        end

        def http_party_headers
          case api_name
          when :apifootball_com
            {}
          when :football_data_org
            { "X-Auth-Token": Configuration.api_token }
          end
        end

        def http_party_url(path)
          case api_name
          when :apifootball_com
            "#{Configuration.api_endpoint}#{path}&APIkey=#{Configuration.api_token}"
          when :football_data_org
            "#{Configuration.api_endpoint}/#{path}"
          end
        end

        def http_party_response(response, result)
          case api_name
          when :apifootball_com
            response_apifootball_com(response, result)
          when :football_data_org
            response_football_data_org(response, result)
          end
        end

        def response_apifootball_com(response, result)
          case result
          when :default
            response
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

        def tier_from_response(response)
          case api_name
          when :apifootball_com
            # n/a
          when :football_data_org
            Tier.set_from_response_headers(response)
          end
        end

        def api_result(klass)
          case api_name
          when :apifootball_com
            :parsed_response
          when :football_data_org
            klass::PATH
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
            when 'Scorers'
              return 'TopScorers'
            end
          when :football_data_org
            case klass
            when 'Countries'
              return 'Areas'
            when 'Events'
              return 'Matches'
            when 'TopScorers'
              return 'Scorers'
            end
          end

          klass
        end
      end
    end
  end
end