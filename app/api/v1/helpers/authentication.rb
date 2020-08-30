module V1
  module Helpers
    module Authentication
      extend Grape::API::Helpers

      TOKEN_PATTERN = /Bearer (.*)$/.freeze

      private

      def authenticate!
        @current_user ||= current_session[:user]
      end

      def current_user
        @current_user
      end

      def current_session
        token = request.headers['Authorization']
        token = token.scan(TOKEN_PATTERN).flatten.last if token.present?
        
        run!(Session::Operation::Current, token: token)
      end
    end
  end
end
