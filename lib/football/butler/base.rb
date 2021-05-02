# frozen_string_literal: true

module Football
  module Butler
    class Base
      # TODO: switch api different messages!
      # {
      #     "message": "Your API token is invalid.",
      #     "errorCode": 400
      # }
      MSG_INVALID_TOKEN   = 'Your API token is invalid.' # 400
      # {
      #     "error": 404,
      #     "message": "Authentification failed!"
      # }

      MSG_NOT_EXIST       = 'The resource you are looking for does not exist' # 404
      # {
      #     "error": 404,
      #     "message": "No teams could be found!"
      # }
      # {
      #     "error": 404,
      #     "message": "No league found (please check your plan)!!"
      # }
      # etc
      MSG_REACHED_LIMIT   = 'You reached your request limit.' # 429
      MSG_INVALID_CONFIG  = 'Invalid Configuration, check empty api_token or empty / invalid api_endpoint!'

      class << self

        # MESSAGES
        def invalid_token?(response)
          # TODO: switch api different messages!
          debugger
          return false if !response.is_a?(Hash) && (response.respond_to?(:parsed_response) && !response.parsed_response.is_a?(Hash))
          response.dig('message') ? response['message'] == MSG_INVALID_TOKEN : false
        end

        def resource_not_found?(response)
          # TODO: switch api different messages!
          return false if !response.is_a?(Hash) && (response.respond_to?(:parsed_response) && !response.parsed_response.is_a?(Hash))
          response.dig('message') ? response['message'] == MSG_NOT_EXIST : false
        end

        def reached_limit?(response)
          return false if !response.is_a?(Hash) && (response.respond_to?(:parsed_response) && !response.parsed_response.is_a?(Hash))
          response.dig('message') ? response['message'].start_with?(MSG_REACHED_LIMIT) : false
        end

        # CODES
        def bad_request?(response)
          # TODO: switch api different messages!
          return false if !response.is_a?(Hash) && (response.respond_to?(:parsed_response) && !response.parsed_response.is_a?(Hash))
          response.dig('errorCode') ? response['errorCode'] == 400 : false
        end

        # RESULT MESSAGES
        def not_found_result(*params)
          error_message("#{params.join(', ')} could not be found.")
        end

        def invalid_config_result
          error_message(MSG_INVALID_CONFIG)
        end

        def unsupported_api_call
          error_message("This method is not supported by this API: #{Configuration.api_name}")
        end

        def error_message(error)
          { message: error }.with_indifferent_access
        end

        # MULTI-API
        def api_switch_method(method, named_params)
          klass = api_switch
          klass.respond_to?(method) ?
            klass.send(method, **named_params) :
            unsupported_api_call
        end

        def api_switch_result
          Configuration.api_result(api_switch)
        end

        def api_switch
          "Football::Butler::#{api_class}::#{this_class}".constantize
        end

        def api_class
          Configuration.api_class
        end

        def this_class
          klass = self.to_s.split('::').last
          Configuration.class_converter(klass)
        end
      end
    end
  end
end
