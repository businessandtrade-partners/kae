class AwardYears::V2026::QaeForms
  class << self
    def mobility_step4
      @mobility_step4 ||= proc do
        about_section :commercial_success_info_block, "" do
          section "mobility_commercial_performance"
        end

        textarea :drops_explain_how_your_business_is_financially_viable, "Explain how your organisation is financially viable." do
          sub_ref "D 1"
          classes "text-words-max"
          required
          context %(
            <p>
              To be eligible for a King's Award for Enterprise, your organisation must be on a financially viable footing.
            </p>
            <p>
              Please explain:
            </p>
            <ul>
              <li>Your financial model;</li>
              <li>Your cash flow position;</li>
              <li>How you are funded: Have you received any form of investment or grant funding? If so, please specify the amounts;</li>
              <li>How you plan to sustain your organisation in future: Income or profit growth plans;</li>
              <li>Your investment or funding strategy.</li>
            </ul>
            <p>
              Some of these may not apply to your organisation, in that case, explain by what other means your organisation ensures financial viability.
            </p>
          )
          pdf_context %(
            To be eligible for a King's Award for Enterprise, your organisation must be on a financially viable footing.

            Please explain:

            \u2022 Your financial model;
            \u2022 Your cash flow position;
            \u2022 How you are funded: Have you received any form of investment or grant funding? If so, please specify the amounts;
            \u2022 How you plan to sustain your organisation in future: Income or profit growth plans;
            \u2022 Your investment or funding strategy.

            Some of these may not apply to your organisation, in that case, explain by what other means your organisation ensures financial viability.
          )
          rows 5
          words_max 300
        end

        innovation_financial_year_date :financial_year_date, "Enter your financial year-end date." do
          classes "fs-trackable"
          ref "D 2"
          required
          financial_date_pointer
        end

        trade_most_recent_financial_year_options :most_recent_financial_year, "Which year would you like to be your most recent financial year that you will submit figures for?" do
          ref "D 2.1"
          required
          option (AwardYear.current.year - 2).to_s, (AwardYear.current.year - 2).to_s
          option (AwardYear.current.year - 1).to_s, (AwardYear.current.year - 1).to_s
          classes "js-most-recent-financial-year fs-trackable fs-two-trackable"
        end

        options :financial_year_date_changed, "Did your year-end date change during your three most recent financial years that you will be providing figures for?" do
          classes "sub-question js-financial-year-change fs-trackable"
          sub_ref "D 2.2"
          required
          yes_no
          default_option "no"
        end

        one_option_by_years_label :financial_year_changed_dates, "Enter your year-end dates for each financial year." do
          classes "sub-question one-option-by-years fs-trackable"
          sub_ref "D 2.3"
          required
          type :date
          label ->(y) { "Financial year #{y}" }
          conditional :financial_year_date_changed, :yes
        end

        textarea :financial_adjustments_explanation, "Explain adjustments to figures." do
          classes "sub-question word-max-strict text-words-max"
          sub_ref "D 2.4"
          required
          context %(
            <p>
              If your financial year-end has changed, you will need to agree with your accountants on how to allocate your figures in all section D questions so that they show three 12-month periods (36 months). This allows for a comparison between years. Please explain what approach you will take to adjust the figures.
            </p>
          )
          rows 2
          words_max 200
          conditional :financial_year_date_changed, :yes
        end

        textarea :financial_year_date_changed_explaination, "Explain why your year-end date changed." do
          classes "sub-question word-max-strict text-words-max"
          sub_ref "D 2.5"
          required
          rows 2
          words_max 100
          conditional :financial_year_date_changed, :yes
        end

        one_option_by_years :employees, "Enter the number of people employed by your organisation in the UK in each of your three most recent financial years." do
          ref "D 3"
          classes "question-employee-min"
          required
          context %(
            <p>You can use the number of full-time employees at the year-end or the average for the 12-month period. Part-time employees should be expressed in full-time equivalents (FTEs).</p>

            <p>If your organisation is based in the Channel Islands or Isle of Man, you should include only the employees who are located there (do not include employees who are in the UK).</p>

            <p>If none, please enter "0".</p>
          )
          type :number
          label ->(y) { "Financial year #{y}" }
          conditional :financial_year_date_changed, :true
          employees_question
        end

        about_section :financials, "Company Financials" do
          ref "D 4"
          section "company_financials_mobility"
        end

        one_option_by_years :total_turnover, "Total income or turnover." do
          classes "sub-question fs-total-turnover fs-trackable"
          ref "D 4.1"
          required
          context %(
            <p>
              If you are a charity, please provide your total income figures; if you are a company, please provide your turnover figures.
            </p>
            <p>
              If none, please enter "0".
            </p>
          )
          type :money
          label ->(y) { "Financial year #{y}" }
        end

        one_option_by_years :net_profit, "Net income or net profit after tax but before dividends." do
          classes "sub-question fs-net-profit fs-trackable"
          sub_ref "D 4.2"
          required
          context %(
            <p>
              If you are a charity, please provide your net income figures; if you are a company, please provide your net profit after tax but before dividends figures.
            </p>
            <p>
              If none, please enter "0".
            </p>
          )
          type :money
          label ->(y) { "Financial year #{y}" }
        end

        one_option_by_years :total_net_assets, "Total net assets." do
          classes "sub-question total-net-assets fs-total-assets fs-trackable"
          sub_ref "D 4.3"
          required
          context %(
            <p>As per your balance sheet. Total assets (fixed and current), minus liabilities (current and long-term).</p>
            <p>
              If none, please enter "0".
            </p>
          )
          type :money
          label ->(y) { "Financial year #{y}" }
        end

        textarea :drops_in_turnover, "If you have had any losses, drops in turnover (or income), or reductions in net profit, please explain them." do
          classes "sub-question text-words-max"
          sub_ref "D 4.4"
          required
          context %(
            <p>
              Please note, when applicable, failure to answer this question may result in assessors not being able to fully assess your financial viability, and therefore, your application may be rejected.
            </p>
            <p>
              If you didn't have any losses, drops in turnover, or reductions in net profit, please state so.
            </p>
          )
          rows 5
          words_max 300
        end

        financial_summary :mobility_financial_summary, "Summary of your company financials (for information only)" do
          sub_ref "D 4.5"
          one_option
        end

        options :received_grant, "Have you received any grant funding or made use of any other government support?" do
          ref "D 5"
          required
          yes_no
          context %(
            <p>Answer yes if you received such support during the last five years.</p>

            <p>To receive grant funding or other government support, the organisation must usually undergo a rigorous vetting process, so if you have received any such funding, assessors will find it reassuring. However, many companies self-finance, and the assessors appreciate that as well.</p>
          )
        end

        textarea :funding_details, "Provide details of dates, sources, types and, if relevant, amounts of the government support." do
          classes "sub-question word-max-strict text-words-max"
          sub_ref "D 5.1"
          required
          context %(
            <p>Include any such support received during the last five years.</p>
          )
          rows 3
          words_max 250
          conditional :received_grant, "yes"
        end

        options :product_estimated_figures, "Are any of the figures used on this page estimates?" do
          ref "D 6"
          required
          context %(
            <p>
              If you haven't reached or finalised your latest year-end yet, it is acceptable to use estimated figures.
            </p>
          )
          yes_no
        end

        confirm :agree_to_provide_actuals, "Agreement to provide actual figures." do
          classes "sub-question"
          sub_ref "D 6.1"
          required
          conditional :product_estimated_figures, :yes
          text %(
            I understand that if this application is shortlisted, I will have to provide actual figures and related VAT returns before the specified November deadline (the exact date will be provided in the shortlisting email).
          )
        end

        textarea :product_estimates_use, "Explain the use of estimates and how much of these are actual receipts or firm orders." do
          classes "sub-question text-words-max"
          sub_ref "D 6.2"
          required
          rows 5
          words_max 250
          conditional :product_estimated_figures, :yes
        end

        upload :supporting_financials, "To support your figures, please upload your financial statements for the years covered in previous questions in section D." do
          classes "sub-question"
          sub_ref "D 7"
          context %(
            <p>
              If you are a company, upload relevant accounts as submitted to the Companies House. In addition, upload the full accounts prepared by your company and your corporation tax returns as submitted to HMRC.
            </p>
            <p>
              If you are a Charity, upload relevant returns as submitted to the Charity Commission.
            </p>
            <p>
              If you are a sole trader or unincorporated partnership, upload relevant accounts and your tax returns as submitted to HMRC.
            </p>
          )
          hint "What are the accepted file formats?", %(
            <p>
              You can upload files in most common formats if they are less than five megabytes.
            </p>
            <p>
              You can upload any of the following file formats: chm, csv, diff, doc, docx, dot, dxf, eps, gif, gml, ics, jpg, kml, odp, ods, odt, pdf, png, ppt, pptx, ps, rdf, rtf, sch, txt, wsdl, xls, xlsm, xlsx, xlt, xml, xsd, xslt, zip.
            </p>
          )
          max_attachments 6
        end
      end
    end
  end
end
