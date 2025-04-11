class Users::SessionsController < Devise::SessionsController
  # Before any authentication, check if we're coming from a password reset
  prepend_before_action :check_password_reset, only: [:new, :create]

  def create
    # Only attempt authentication if not from password reset
    if session[:from_password_reset]
      # If from password reset, show the login form without attempting authentication
      session.delete(:from_password_reset)
      flash[:notice] = I18n.t("devise.passwords.send_paranoid_instructions")
      redirect_to new_user_session_path
    else
      super
      flash.discard(:notice)
    end
  end

  def new
    # If we're coming directly from a password reset page
    if session[:from_password_reset]
      # Update flash message but don't clear the flag yet (will be cleared in create)
      flash[:notice] = I18n.t("devise.passwords.send_paranoid_instructions")
    end

    super
  end

  private

  def check_password_reset
    # Check referrer for password resets
    if request.referer&.include?("passwords") || params[:from_password_reset]
      session[:from_password_reset] = true
      # Force sign out if there's any existing session
      sign_out(current_user) if user_signed_in?
    end
  end
end
