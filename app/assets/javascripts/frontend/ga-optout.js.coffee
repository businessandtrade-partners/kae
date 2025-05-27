jQuery ->
  if !Cookies.get("cookie_preferences_set")
    $(".govuk-cookie-banner").attr("tabindex", "-1")
    $(".govuk-cookie-banner").attr("aria-live", "polite")
    $(".govuk-cookie-banner").removeAttr("hidden")
    $(".govuk-cookie-banner").attr("role", "alert")

    $(".govuk-cookie-banner .cookies-action").on "click", (e) ->
      e.preventDefault()

      Cookies.set("cookie_preferences_set", $(@).val(), { expires: 3650 })

      $(".govuk-cookie-banner .initial-message").attr("hidden", "true")

      if $(@).val() == "accept"
        settings = JSON.stringify({ "essential": true, "settings": true, "usage": true, "campaigns": true })
        expiry_date = new Date(new Date().setFullYear(new Date().getFullYear() + 1))
        document.cookie = "cookies_policy=#{settings}; expires=#{expiry_date}; path=/"
        $(".govuk-cookie-banner .accept-message").removeAttr("hidden")
      else
        $(".govuk-cookie-banner .reject-message").removeAttr("hidden")

    $(".govuk-cookie-banner .hide-message").on "click", (e) ->
      e.preventDefault()
      $(".govuk-cookie-banner").attr("hidden", "true")

  if $("#ga-optout-input").length

    document.querySelector('.cookie-consent-form').addEventListener 'submit', (e) ->
      e.preventDefault()
      e.stopPropagation()

    $("#ga-optout-input").prop("checked", Cookies.get("cookie_preferences_set") == "reject" || !Cookies.get("cookie_preferences_set"))
    $("#ga-optin-input").prop("checked", Cookies.get("cookie_preferences_set") == "accept")
    if Cookies.get("cookie_preferences_set") == "accept"
      $("#ga-settings-form-group").attr("hidden", false)

      try
        settings = JSON.parse(Cookies.get("cookies_policy"))
        $("#ga-settings-optout-input").prop("checked", settings["settings"] == false || !settings["settings"])
        $("#ga-settings-optin-input").prop("checked", settings["settings"] == true)
        $("#ga-usage-optout-input").prop("checked", settings["usage"] == false || !settings["usage"])
        $("#ga-usage-optin-input").prop("checked", settings["usage"] == true)
        $("#ga-campaigns-optout-input").prop("checked", settings["campaigns"] == false || !settings["campaigns"])
        $("#ga-campaigns-optin-input").prop("checked", settings["campaigns"] == true)
      catch
        $("#ga-settings-optin-input").prop("checked", true)
        $("#ga-usage-optin-input").prop("checked", true)
        $("#ga-campaigns-optin-input").prop("checked", true)
    else
      $("#ga-settings-form-group").attr("hidden", true)

    $("#ga-optout").on "click", (e) ->
      e.preventDefault()

      if $("#ga-optout-input").prop("checked")
        Cookies.set("cookie_preferences_set", "reject", { expires: 3650 })
        Cookies.remove("cookies_policy")
        $("#ga-settings-form-group").attr("hidden", true)
      else if $("#ga-optin-input").prop("checked")
        Cookies.set("cookie_preferences_set", "accept", { expires: 3650 })
        settings = JSON.stringify({ "essential": true, "settings": $("#ga-settings-optin-input").prop("checked"), "usage": $("#ga-usage-optin-input").prop("checked"), "campaigns": $("#ga-campaigns-optin-input").prop("checked") })
        expiry_date = new Date(new Date().setFullYear(new Date().getFullYear() + 1))
        document.cookie = "cookies_policy=#{settings}; expires=#{expiry_date}"
        $("#ga-settings-form-group").attr("hidden", false)

      $(".cookie-settings-banner").removeClass("hide").focus()
