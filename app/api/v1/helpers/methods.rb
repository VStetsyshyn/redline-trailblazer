module V1
  module Helpers
    module Methods
      extend Grape::API::Helpers

      def run!(operation, params)
        result = operation.call(params)
        result.success? ? render_result(result) : render_error(result)
      end

      private

      def render_result(result)
        return result if result[:user].present?

        header 'Auth-Token', result[:token]
        render result[:model], serializer: "#{result[:model].try(:klass).try(:name) || result[:model].class.name}Serializer"
      end

      def render_error(result)
        case result[:errors]&.keys
        when [:auth_error]
          error!({ message: (result[:errors][:auth_error]).to_s }, 401)
        when [:permission_error]
          error!({ message: (result[:errors][:permission_error]).to_s }, 401)
        when [:not_found_error]
          error!({ message: (result[:errors][:not_found_error]).to_s }, 404)
        else
          error!({ message: (result['contract.default']&.errors&.messages || result[:errors][:default]).to_s }, 422)
        end
      end
    end
  end
end
