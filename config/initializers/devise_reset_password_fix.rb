# This initializer overrides Devise's automatic sign-in behavior after password reset
module Devise
  module Controllers
    module Helpers
      # Override the original sign_in method to check for password reset context
      alias_method :original_sign_in, :sign_in

      def sign_in(resource_or_scope, *args)
        scope = Devise::Mapping.find_scope!(resource_or_scope)

        # Don't automatically sign in if this is a password reset session for users
        if session[:from_password_reset] && scope.to_s == "user"
          Rails.logger.info "Prevented auto sign-in after password reset for user"
          return false
        end

        original_sign_in(resource_or_scope, *args)
      end
    end
  end
end
