# frozen_string_literal: true

module Football
  module Butler
    module Configuration
      # API
      DEFAULT_API_URL       = "https://api.football-data.org"

      DEFAULT_API_TOKEN     = nil
      DEFAULT_API_VERSION   = 2
      DEFAULT_API_ENDPOINT  = "#{DEFAULT_API_URL}/v#{DEFAULT_API_VERSION}"
      
      # ADDITIONAL
      DEFAULT_TIER_PLAN     = nil
      DEFAULT_WAIT_ON_LIMIT = false

      class << self
        attr_accessor :api_version, :api_token, :api_endpoint, :tier_plan, :wait_on_limit, :init_done

        def configure
          raise "You need to configure football-butler first, see readme." unless block_given?

          yield self

          @api_token      ||= DEFAULT_API_TOKEN
          @api_version    ||= DEFAULT_API_VERSION
          @api_endpoint   ||= DEFAULT_API_ENDPOINT
          @tier_plan      ||= DEFAULT_TIER_PLAN
          @wait_on_limit  ||= DEFAULT_WAIT_ON_LIMIT

          @init_done = true

          true
        end

        def reconfigure(
          api_token: nil, api_version: nil, api_endpoint: nil, tier_plan: nil, wait_on_limit: nil
        )

          reset unless @init_done

          @api_token      = api_token unless api_token.nil?
          unless api_version.nil?
            @api_version    = api_version
            @api_endpoint   = "#{DEFAULT_API_URL}/v#{api_version}" if api_endpoint.nil?
          end
          @api_endpoint   = api_endpoint unless api_endpoint.nil?
          @tier_plan      = tier_plan unless tier_plan.nil?
          @wait_on_limit  = wait_on_limit unless wait_on_limit.nil?

          true
        end

        def reset
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
      end
    end
  end
end