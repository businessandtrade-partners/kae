class CheckAccountOnBouncesEmail
  DEBOUNCE_API_RESPONSE_CODES = {
    "1" => "Syntax. Not an email.",
    "2" => "Spam Trap. Spam-trap by ESPs.",
    "3" => "Disposable. A temporary, disposable address.",
    "4" => "Accept-All. A domain-wide setting.",
    "5" => "Delivarable. Verified as real address.",
    "6" => "Invalid. Verified as not valid.",
    "7" => "Unknown. The server cannot be reached.",
    "8" => "Role. Role accounts such as info, support, etc.",
  }

  VALID_DEBOUNCE_API_CODES = [4, 5, 7, 8]

  attr_accessor :user,
    :email,
    :code

  def initialize(user)
    @user = user
    @email = user.email
  end

  class << self
    def bounces_email?(email)
      User.bounced_emails
          .find_by(email: email)
          .present?
    end

    def bounce_reason(code)
      DEBOUNCE_API_RESPONSE_CODES[code]
    end
  end
end
