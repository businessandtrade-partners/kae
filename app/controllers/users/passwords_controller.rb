class Users::PasswordsController < Devise::PasswordsController
  include Users::ReasonablyParanoidable

  # Override the create method to customize the redirect after password reset request
  def create
    # Force sign out any current user
    sign_out(current_user) if user_signed_in?

    # Ensure Warden doesn't try to auto-authenticate
    request.env["warden"].logout

    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      # Instead of using respond_with, use a direct redirect
      flash[:notice] = I18n.t("devise.passwords.send_paranoid_instructions")

      # Clear EVERYTHING from session that could be related to authentication
      session.delete("warden.user.user.key")
      session.delete("devise.user_sessions")
      session.delete("user_return_to")
      request.env["devise.skip_storage"] = true
      request.env["devise.skip_trackable"] = true

      # Set a session flag to indicate this is coming from a password reset
      session[:from_password_reset] = true

      # Redirect to sign in page
      redirect_to new_user_session_path(from_password_reset: true)
    else
      respond_with(resource)
    end
  end
end
