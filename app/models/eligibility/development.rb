class Eligibility::Development < Eligibility
  AWARD_NAME = "Sustainable Development"

  property :adheres_to_sustainable_principles,
    boolean: true,
    label: "Can you demonstrate that the organisation as a whole has consistently adhered to sustainability practices (as outlined in the previous question) for at least 2 years, and that in some key areas you can demonstrate outstanding performance?",
    accept: :true,
    hint: %(
      <p class='govuk-hint'>
        Please note, we are assessing the whole organisation, not just particular initiatives. As a minimum, we expect all winning organisations to have good practices around climate change/working towards Net Zero and there are further questions on this in the application form itself.
      </p>
    )

  property :able_to_provide_actual_figures,
    boolean: true,
    label: "Will you be able to provide financial figures for your three most recent financial years, covering 36 months?",
    accept: :true,
    hint: %(
      <p class='govuk-hint'>
        For the purpose of this application, your most recent financial year is your last financial year ending before the #{Settings.current.deadlines.where(kind: "submission_end").first.decorate.formatted_trigger_date("with_year")} - the application submission deadline.
      </p>
      <p class='govuk-hint'>
        If you haven't reached your most recent year-end, you can provide estimated figures in the interim.
      </p>
    )
end
