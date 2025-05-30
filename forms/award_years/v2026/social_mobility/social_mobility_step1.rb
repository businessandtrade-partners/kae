class AwardYears::V2026::QaeForms
  class << self
    def mobility_step1
      @mobility_step1 ||= proc do
        about_section :consent_due_diligence_header, "" do
          section "due_diligence"
        end

        confirm :confirmation_of_consent, "Consent to apply granted by the head of the organisation" do
          ref "A 1.1"
          required
          text "I confirm that I have the consent of the head of my organisation to fill in and submit this entry form."
        end

        sub_fields :head_of_business, "Details of the head of your organisation" do
          sub_ref "A 1.2"
          required
          classes "sub-question sub-fields-word-max"
          sub_fields([
            { title: "Title" },
            { first_name: "First name" },
            { last_name: "Last name" },
            { honours: "Personal Honours (optional)", hint: "For example, Lieutenant (LVO), Member of the Most Excellent Order of the British Empire (MBE), Air Force Cross (AFC). Please do not include qualifications such as a master's degree or doctorate." },
            { job_title: "Job title or role in the organisation" },
            { email: "Email address" },
          ])
          sub_fields_words_max 50
        end

        header :due_diligence_header, "Organisation's conduct & due diligence checks" do
          ref "A 2"
          context %{
            <p class="govuk-body">Before you apply, please consider any issues that may prevent your application from receiving routine clearance as part of the due diligence process that we undertake with a number of Government Departments and Agencies informing the decision to grant an award.</p>
            <p class="govuk-body">You must be able to show responsible business conduct concerning the environment, wider society, your workforce, customers, suppliers, and corporate governance. This includes having a good, continuous compliance record covering at least five years or your application period and up to now (whichever is the longest period).</p>
            <p class="govuk-body">Please check with your directors, accountant and legal representatives to see if there are any issues before applying.</p>
            <p class="govuk-body">Some examples of issues that may prevent your organisation from receiving final clearance for The King's Awards for Enterprise Award:</p>
            <ul class="govuk-list govuk-list--bullet">
              <li>Fines, penalties or warnings received from any government department or agency;</li>
              <li>Not paying the right amount of tax on time;</li>
              <li>Non-compliance with regulations;</li>
              <li>Failure to pay your workforce the minimum wage;</li>
              <li>Accident within the workplace which has resulted in harm being caused to the environment or workforce;</li>
              <li>Environmental pollution;</li>
              <li>Failure to fully comply with administrative filing requirements as stipulated by any Government Department or Agency.</li>
            </ul>
            <details class='govuk-details govuk-!-margin-top-3 govuk-!-margin-bottom-0' data-module="govuk-details">
              <summary class="govuk-details__summary">
                <span class="govuk-details__summary-text">
                  View Government Departments and Agencies we undertake due diligence checks with
                </span>
              </summary>
              <div class="govuk-details__text">
                <ul>
                  <li>Biotechnology & Biological Sciences Research Council</li>
                  <li>Cabinet Office</li>
                  <li>Charity Commission</li>
                  <li>Companies House</li>
                  <li>Competition and Markets Authority</li>
                  <li>Crown Commercial Service</li>
                  <li>Department for Business and Trade</li>
                  <li>Department for Communities and Local Government</li>
                  <li>Department for Culture, Media & Sport</li>
                  <li>Department for Education</li>
                  <li>Department for Energy, Security and Net Zero</li>
                  <li>Department for Environment, Food & Rural Affairs</li>
                  <li>Department for International Trade</li>
                  <li>Department for Science, Innovation and Technology</li>
                  <li>Department for Transport</li>
                  <li>Department of Economic Development, Isle of Man</li>
                  <li>Department for the Economy NI</li>
                  <li>Department of Health</li>
                  <li>Environment Agency</li>
                  <li>Financial Conduct Authority</li>
                  <li>Food Standards Agency</li>
                  <li>Forestry Commission</li>
                  <li>Guernsey Government</li>
                  <li>Health and Safety Executive</li>
                  <li>HM Courts & Tribunals Service</li>
                  <li>HM Revenue & Customs</li>
                  <li>Home Office</li>
                  <li>Insolvency Service</li>
                  <li>Intellectual Property Office</li>
                  <li>Invest NI</li>
                  <li>Jersey Government</li>
                  <li>Ministry of Defence</li>
                  <li>Ministry of Justice</li>
                  <li>Medical Research Council Technology</li>
                  <li>National Measurement Office</li>
                  <li>Natural England</li>
                  <li>Natural Environment Research Council</li>
                  <li>Office of the Scottish Charity Regulator</li>
                  <li>Scottish Government</li>
                  <li>Scottish Environment Protection Agency</li>
                  <li>Scottish Funding Council</li>
                  <li>Serious Fraud Office</li>
                  <li>Trades Union Congress</li>
                  <li>UK Export Finance</li>
                  <li>Wales Government</li>
                </ul>
                <p class="govuk-body">Non-compliance that occurred and was resolved before the period covering your application will be assessed on a case-by-case basis.</p>
              </div>
            </details>
          }
          pdf_context_with_header_blocks [
            [:normal, %(
              Before you apply, please consider any issues that may prevent your application from receiving routine clearance as part of the due diligence process that we undertake with a number of Government Departments and Agencies informing the decision to grant an award.

              You must be able to show responsible business conduct concerning the environment, wider society, your workforce, customers, suppliers, and corporate governance. This includes having a good, continuous compliance record covering at least five years or your application period and up to now (whichever is the longest period).

              Please check with your directors, accountant and legal representatives to see if there are any issues before applying.

              Some examples of issues that may prevent your organisation from receiving final clearance for The King's Awards for Enterprise Award:

              \u2022 Fines, penalties or warnings received from any government department or agency;
              \u2022 Not paying the right amount of tax on time;
              \u2022 Non-compliance with regulations;
              \u2022 Failure to pay your workforce the minimum wage;
              \u2022 Accident within the workplace which has resulted in harm being caused to the environment or workforce;
              \u2022 Environmental pollution;
              \u2022 Failure to fully comply with administrative filing requirements as stipulated by any Government Department or Agency.

              Government Departments and Agencies we undertake due diligence checks with:

              \u2022 Biotechnology & Biological Sciences Research Council
              \u2022 Cabinet Office
              \u2022 Charity Commission
              \u2022 Companies House
              \u2022 Competition and Markets Authority
              \u2022 Crown Commercial Service
              \u2022 Department for Business and Trade
              \u2022 Department for Communities and Local Government
              \u2022 Department for Culture, Media & Sport
              \u2022 Department for Education
              \u2022 Department for Energy, Security and Net Zero
              \u2022 Department for Environment, Food & Rural Affairs
              \u2022 Department for International Trade
              \u2022 Department for Science, Innovation and Technology
              \u2022 Department for Transport
              \u2022 Department of Economic Development, Isle of Man
              \u2022 Department for the Economy NI
              \u2022 Department of Health
              \u2022 Environment Agency
              \u2022 Financial Conduct Authority
              \u2022 Food Standards Agency
              \u2022 Forestry Commission
              \u2022 Guernsey Government
              \u2022 Health and Safety Executive
              \u2022 HM Courts & Tribunals Service
              \u2022 HM Revenue & Customs
              \u2022 Home Office
              \u2022 Insolvency Service
              \u2022 Intellectual Property Office
              \u2022 Invest NI
              \u2022 Jersey Government
              \u2022 Ministry of Defence
              \u2022 Ministry of Justice
              \u2022 Medical Research Council Technology
              \u2022 National Measurement Office
              \u2022 Natural England
              \u2022 Natural Environment Research Council
              \u2022 Office of the Scottish Charity Regulator
              \u2022 Scottish Government
              \u2022 Scottish Environment Protection Agency
              \u2022 Scottish Funding Council
              \u2022 Serious Fraud Office
              \u2022 Trades Union Congress
              \u2022 UK Export Finance
              \u2022 Wales Government

              Non-compliance that occurred and was resolved before the period covering your application will be assessed on a case-by-case basis.
            )],
          ]
        end

        confirm :strong_esg_record, "Strong environmental, social, and corporate governance (ESG) record" do
          ref "A 2.1"
          classes "sub-question"
          required
          show_ref_always true
          text %(
            I confirm that we have demonstrated strong environmental, social and corporate governance practices for at least five years or the period of our application (from 2 to 5 years) and up to now (whichever is the greatest).
          )
        end

        textarea :major_issues_overcome, "Please explain any statutory or regulatory issues that you have overcome in recent years and the remedial steps you have taken." do
          ref "A 2.2"
          classes "sub-question text-words-max"
          required
          context %(
            <p class="govuk-body">For example, non-compliance, breaches, or fines.</p>
          )
          words_max 200
        end

        options :shortlisted_case_confirmation_i_am_not_aware_of_any_matter, "Organisation's conduct" do
          ref "A 2.3"
          required
          yes_no
          context %(
            <p>
              The King's Awards for Enterprise recognises leaders in their field who adopt exemplary working practices and inspire other businesses. The King's Awards for Enterprise recipients' past and present conduct should not cause reputational damage to the Awards. On this basis, are you satisfied that your organisation would merit a Royal Award?
            </p>
          )
        end

        confirm :agree_being_contacted_by_kao, "Consent to enquiries by The King's Awards Office" do
          ref "A 2.4"
          required
          show_ref_always true
          text %(
            I consent to all necessary enquiries being made by The King's Awards Office concerning this entry. This includes enquiries made of Government Departments and Agencies in discharging their responsibilities to vet any business unit which might be granted a King's Award to ensure the highest standards of propriety.
          )
        end

        confirm :due_diligence, "Agree to the outcome of the due diligence checks" do
          ref "A 2.5"
          required
          show_ref_always true
          text %(
            I understand and agree that the outcome of the due diligence checks which The King's Awards for Enterprise Office undertakes with Government Departments and Agencies is final and cannot be overturned.
          )
        end

        confirm :shortlisted_case_confirmation, "Commercial performance" do
          ref "A 3"
          required
          show_ref_always true
          context %(
            <p>
              You will have to provide financial information and related financial statements for the three most recent financial years (covering 36 months) to demonstrate that the organisation is financially viable.
            </p>
            <p>
              For the purpose of this application, your most recent financial year is your last financial year ending before the #{Settings.current.deadlines.where(kind: "submission_end").first.decorate.formatted_trigger_date("with_year")} - the application submission deadline.
            </p>
            <p>
              If you haven't reached your most recent year-end, you can provide estimated figures in the interim.
            </p>
          )
          text %(
            I understand that I have to provide financial information and related financial statements for the three most recent financial years (covering 36 months) to demonstrate that the organisation is financially viable.
          )
        end
      end
    end
  end
end
