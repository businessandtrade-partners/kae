class QaeFormBuilder
  class AboutSectionQuestionValidator < HeaderQuestionValidator
  end

  class AboutSectionQuestionBuilder < HeaderQuestionBuilder
    def section ref
      data = section_data ref

      @q.context = data.map { |d| form_context(d) }.join

      @q.pdf_context_with_header_blocks = data.flat_map { |d| pdf_context(d) }
    end

    private

    def form_context(data)
      @link = data.link
      %(
        <h3 class="govuk-heading-m">#{data.header}</h3>
        #{data.context.map { |c| "<p class='govuk-body'>#{c}</p>" }.join}
      )
    end

    def pdf_context(data)
      [
        [:bold, data.header],
        [:normal, data.context.map { |c| c.gsub(/<br\s*\/?>/, "") }.join("\n\n")],
      ]
    end

    def section_data(ref)
      case ref
      when "due_diligence"
        [about_section_A]
      when "company_information"
        [about_section_B, small_organisations]
      when "your_innovation"
        [about_section_C_innovation, word_limits, technical_language, supplementary_materials]
      when "your_international_trade"
        [about_section_C_international_trade, small_organisations, word_limits, technical_language, supplementary_materials]
      when "your_sustainable_development"
        [about_section_C_sustainable_development, small_organisations, supplementary_materials_development]
      when "your_social_mobility"
        [about_section_C_social_mobility, award_target, social_mobility_definition, disadvantaged_groups, evidence, supplementary_materials, small_organisations, small_initiatives, technical_language]
      when "innovation_commercial_performance"
        [about_section_D_innovation, financial_periods_innovation, estimated_figures]
      when "trade_commercial_performance"
        [about_section_D_trade, financial_periods_trade, estimated_figures]
      when "development_commercial_performance"
        [about_section_D, financial_periods, estimated_figures_development]
      when "mobility_commercial_performance"
        [about_section_D, financial_periods, estimated_figures_development]
      when "company_financials_innovation"
        [group_entries, required_figures_company, figures_format]
      when "company_financials_trade"
        [group_entries, required_figures_trade, figures_format]
      when "company_financials_development"
        [group_entries, estimated_figures_development, figures_format]
      when "company_financials_mobility"
        [group_entries, estimated_figures_development, figures_format]
      when "innovation_financials"
        [about_D6, required_figures_innovation, figures_format]
      when "innovation_ESG"
        [about_section_E, answering_questions, small_organisations]
      when "trade_ESG"
        [about_section_E, answering_questions, small_organisations]
      when "mobility_ESG"
        [about_section_E, answering_questions, small_organisations]
      end
    end

    ######## Section A ########
    def about_section_A
      OpenStruct.new(
        header: "About section A",
        context: [
          "This section is to confirm that you have the authorisation to apply, that your organisation's past and present conduct would not cause reputational damage to the Awards, and what will happen after you apply in terms of due diligence and verification of commercial figures. We recommend you carefully answer section A questions before proceeding with the rest of the application.",
        ],
      )
    end
    ######## Section A ########

    ######## Section B ########
    def about_section_B
      OpenStruct.new(
        header: "About section B",
        context: [
          "The purpose of this section is to collect specific information about your organisation. It is important that the details are accurate as they cannot be changed after the submission deadline.",
          "This information will help us to identify your organisation and will also enable us to undertake due diligence checks with other Government Departments and Agencies if your application is shortlisted.",
        ],
      )
    end

    def small_organisations
      OpenStruct.new(
        header: "Small organisations",
        context: [
          "The King's Awards for Enterprise is committed to acknowledging the efforts of eligible organisations of all sizes. If you are a small organisation, please do not be intimidated by the questions that are less relevant to you – answer all questions to the degree that you can and provide evidence of impact. During the assessment of your application, the size and sector of your organisation will be taken into consideration.",
        ],
      )
    end

    ######## Section B ########

    ######## Section C ########

    # About Section C
    def about_section_C_innovation
      OpenStruct.new(
        header: "About section C",
        context: [
          "This section is structured to enable you to tell your success story - including describing the innovation's development, implementation and impact. This enables the assessing team to understand the role innovation plays within your overall business and how this impacts the performance of your business.",
        ],
      )
    end

    def about_section_C_international_trade
      OpenStruct.new(
        header: "About section C",
        context: [
          "The purpose of this section is to enable the assessing team to understand your company, its product, services, and the role exporting plays within your overall business. We need to understand how this impacts the overall performance of your business.",
        ],
      )
    end

    def about_section_C_sustainable_development
      OpenStruct.new(
        header: "About section C",
        context: [
          "When completing this section, assessors recognise that some questions may be answered in more detail than others, and therefore, free text is provided with flexibility in mind. The extent of your answer depends on your organisation's stage in its sustainability journey and the material impacts associated with the sector in which you operate. All organisations should provide as much relevant information as possible, using evidence and examples to support responses.",
        ],
      )
    end

    def about_section_C_social_mobility
      OpenStruct.new(
        header: "About section C",
        context: [
          "This section enables you to present the details of how your organisation has made a difference by promoting opportunity through social mobility for at least two years (a minimum of 24 months)."
        ],
      )
    end
    # Covid impact
    def covid_impact
      OpenStruct.new(
        header: "Impact of COVID-19 and other adverse events",
        context: [
          "If your growth was affected by adverse national and global events - such as COVID-19, the war in Ukraine, flooding, and wildfires - this will be taken into consideration during the assessment process. Question C6 allows you to explain how your organisation was affected and how you responded to these challenges.",
        ],
      )
    end

    def covid_impact_development
      OpenStruct.new(
        header: "Impact of COVID-19 and other adverse events",
        context: [
          "If your growth was affected by adverse national and global events - such as COVID-19, the war in Ukraine, flooding, and wildfires - this will be taken into consideration during the assessment process. Question D6 allows you to explain how your organisation was affected and how you responded to these challenges.",
        ],
      )
    end

    # Word limits
    def word_limits
      OpenStruct.new(
        header: "Word limits",
        context: [
          "What matters most is the quality of the information and insight you provide. The word limits for each question are just there to stop your application from becoming overlong and give an idea of the relative level of detail the assessors are looking for.",
        ],
      )
    end

    # Technical language
    def technical_language
      OpenStruct.new(
        header: "Technical language",
        context: [
          "Please avoid using technical language - we need to understand your answers without having specific knowledge of your industry. If you use acronyms, please define them when you use them for the first time.",
        ],
      )
    end

    # Supplementary materials
    def supplementary_materials
      OpenStruct.new(
        header: "Supplementary materials",
        context: [
          "You may add up to three short and relevant materials (documents or online links) in Section F to support your answers, with a maximum size of 5MB each. If used, you must reference the documents clearly by name in your responses. Assessors have limited time to evaluate your application, so additional documents should be short and relevant. Do not use these materials as a substitute for narrative answers to the questions, as they may be overlooked. Please do not combine documents into a single file, and do not link to folders.",
        ],
      )
    end

    def supplementary_materials_development
      OpenStruct.new(
        header: "Supplementary materials",
        context: [
          "You may add up to three short and relevant materials (documents or online links) in Section E to support your answers, with a maximum size of 5MB each. If used, you must reference the documents clearly by name in your responses. Assessors have limited time to evaluate your application, so additional documents should be short and relevant. Do not use these materials as a substitute for narrative answers to the questions, as they may be overlooked. Please do not combine documents into a single file, and do not link to folders.",
        ],
      )
    end

    # UN SDGs
    def un_sdgs
      OpenStruct.new(
        header: "United Nations Sustainable Development Goals (UN SDGs)",
        context: [
          "You may find it helpful to familiarise yourself with the United Nations 17 Sustainable Development Goals (UN SDGs). While they include impacts at a national level, you may want to reference the real positive impact your organisation contributes towards them.",
          "You do not need to show impact in each of these areas, only the ones that are most applicable to your sustainable development interventions.",
          "You can find more <a class='govuk-link' target='_blank' href='https://www.un.org/sustainabledevelopment/sustainable-development-goals/.'>information about each goal on the United Nations (UN) website.</a>",
        ],
      )
    end

    def award_target
      OpenStruct.new(
        header: "This award is aimed at:",
        context: [
          "This award aims to recognise those organisations engaged in an enterprise whose core activity is not social mobility but have initiatives that support it.",
          "Commercial organisations, not-for-profits, social enterprises, and charities are welcome to apply.",
          'The initiative should be structured and designed to target and support people from disadvantaged backgrounds as defined in the list under "Disadvantaged groups" further down in this section.',
          "Please note, to be considered for the award, your initiative must go well beyond compliance with the law in relation to disadvantaged groups.",
          "An initiative could be a programme, activity, course, system, business model approach or strategy, service or application, practice, policy, or product. It can include activities to promote opportunity directly in your organisation or through local or national outreach initiative.",
          "Your answers will provide us with evidence of how this benefits the participants, your organisation and wider society. Explain the reasons why you implemented the initiative and the outcomes it has achieved.",
          "If you have more than one initiative, you can include some or all of them in your answers as long as you are consistent throughout.",
        ],
      )
    end

    def social_mobility_definition
      OpenStruct.new(
        header: "Social mobility definition",
        context: [
          "Social mobility is a measure of the ability to move from a lower socio-economic background to higher socio-economic status.",
          "• Socio-economic background is a set of social and economic circumstances from which a person has come.",
          "• Socio-economic status is a person's current social and economic circumstances."
        ]
      )
    end

    def disadvantaged_groups
      OpenStruct.new(
        header: "Disadvantaged groups",
        context: [
          "For the purpose of this award, we classify people as being from a lower socio-economic background if they come from one of the following disadvantaged backgrounds:",
          "• Black, Asian and minority ethnic people, including Gypsy and Traveller people;",
          "• Asylum seekers and refugees or children of refugees;",
          "• Young people (over 16 years old) with English as a second language;",
          "• Long-term unemployed or people who grew up in workless households;",
          "• People on low incomes;",
          "• Lone parents - single adult heads of a household who are responsible for at least one dependent child, who normally lives with them;",
          "• People who received free school meals or if there are children in the person's current household who receive free school meals;",
          "• Homeless and insecurely housed, including those at risk of becoming homeless and those in overcrowded or substandard housing;",
          "• Care leavers - people who spent time in care before the age of 18. Such care could be in foster care, children's homes, or other arrangements outside the immediate or extended family;",
          "• Young people (over 16 years old) who are not in education, employment or training (NEET) or are at risk of that;",
          "• People who attended schools with lower-than-average attainment or if there are children in the person's current household who attend school with lower-than-average attainment;",
          "• People whose parents' or guardians' highest level of qualifications by the time the person was 18 was a secondary school;",
          "• People with a physical or mental disability that has a substantial and adverse long-term effect on a person's ability to do normal daily activities;",
          "• People recovering or who have recovered from addiction;",
          "• Survivors of domestic violence;",
          "• Military veterans;",
          "• Ex-offenders;",
          "• Families of prisoners;",
          "This is not an exhaustive list. However, if you are putting forward a group that is not on this list, you will have to explain why you believe the group you support should be considered disadvantaged.",
          "Please note to be eligible for the award, your target group members, the participants, have to be based in the UK (including the Channel Islands and the Isle of Man) and be over 16 years old at the start of the engagement."
        ]
      )
    end

    def evidence
      OpenStruct.new(
        header: "Evidence",
        context: [
          "Applicants need to provide quantitative evidence (for example, numbers, figures) and qualitative evidence (for example, stories, quotes) to support the claims made.",
          "The evidence could include but is not limited to internal records, third-party data, including independent third-party evaluations, survey responses, interviews, ad-hoc feedback.  Please note, while quotes and anecdotal feedback will strengthen your application, they are not sufficient on their own.",
          "Please note that you will need to provide diversity data about people your initiative is supporting. If you are unable to provide this data, we will be unable to assess your application effectively, and you will be ineligible. Some companies have felt they cannot provide the data due to GDPR and concerns over privacy. However, diversity data can usually be provided anonymously and with consent. If in doubt, please ring The King's Awards for Enterprise helpline to discuss this further, and we will advise."
        ]
      )
    end

    def small_initiatives
      OpenStruct.new(
        header: "Small initiatives",
        context: [
          "The King's Awards for Enterprise recognise that some initiatives will have small numbers. What we are seeking here is a demonstration of the impact - we will consider the type of disadvantaged groups you engage with and how challenging it is to reach out to them, recruit them and provide supportive, sustained activity.",
          "If relevant, please explain such issues and, importantly, show how the numbers you provide link to your goals."
        ]
      )
    end
    ######## Section C ########

    ######## Section D ########

    # About Section D
    def about_section_D_innovation
      OpenStruct.new(
        header: "About section D",
        context: [
          "All applicants must demonstrate a certain level of financial performance. This section enables you to show the impact that your innovation has had on your organisation's financial performance. Financial information must be supplied so your organisation's commercial performance can be evaluated. It is important that these details are accurate, as you will need to verify them if shortlisted.",
          "We recommend you get your accountant to assist you with this section.",
        ],
      )
    end

    def about_section_D_trade
      OpenStruct.new(
        header: "About section D",
        context: [
          "All applicants must demonstrate a certain level of financial performance. This section enables you to show the impact that your international trade has had on your organisation's financial performance. Financial information must be supplied so your organisation's commercial performance can be evaluated. It is important that these details are accurate, as you will need to verify them if shortlisted.",
          "We recommend you get your accountant to assist you with this section.",
        ],
      )
    end

    def about_section_D
      OpenStruct.new(
        header: "About section D",
        context: [
          "You must demonstrate that your organisation is financially viable. You will also need to upload your financial statements to provide evidence of this.",
          "We recommend you get your accountant to assist you with this section.",
        ],
      )
    end

    # Financial periods
    def financial_periods_innovation
      OpenStruct.new(
        header: "Periods the figures are required for",
        context: [
          "We ask you to provide figures for your five most recent financial years. If you started trading within the last five years, you only need to provide figures for the years you have been trading. However, to meet minimum eligibility requirements, you must be able to provide figures for at least your two most recent financial years, covering the full 24 months.",
        ],
      )
    end

    def financial_periods_trade
      OpenStruct.new(
        header: "Periods the figures are required for",
        context: [
          "Depending on which award you are applying for, you must be able to provide financial figures for your three most recent financial years, covering exactly 36 consecutive months; or if you are applying for a 6-year award (see question D1), you must provide figures for the last six financial years, covering exactly 72 consecutive months.",
          "If you have changed your year-end during the period of your application, see D3.2 for an explanation of how this must be dealt with.",
        ],
      )
    end

    def financial_periods
      OpenStruct.new(
        header: "Periods the figures are required for",
        context: [
          "You must provide financial figures for your three most recent financial years, covering 36 months.",
          "If you have changed your year-end during the period of your application, see D2.4 for an explanation of how this must be dealt with.",
        ],
      )
    end

    # Estimated figures
    def estimated_figures
      OpenStruct.new(
        header: "Estimated figures",
        context: [
          "If your financial year ends before the September deadline and verified figures are not yet available, you can submit estimated figures based on your latest financial year.",
          "If shortlisted, you must provide externally verified figures by mid-November.",
          "Example: If your year-end is in August and verification will be ready by October or November, you can submit estimated figures.",
          "If you cannot provide verified figures by November, use the previous year's verified figures.",
          "Typically, the verification is done by an external accountant who prepares your annual accounts or returns or, in the case of a larger organisation, who conducts your financial audit.",
        ],
      )
    end

    def estimated_figures_development
      OpenStruct.new(
        header: "Estimated figures",
        context: [
          "If you haven't reached or finalised accounts for your most recent financial year, you can provide estimated figures for now.",
          "If you are shortlisted, you will have to provide the actual figures and the related VAT returns before the specified November deadline (the exact date will be provided in the shortlisting email).",
        ],
      )
    end

    # Group entries
    def group_entries
      OpenStruct.new(
        header: "Group entries",
        context: [
          "A parent company making a group entry should include the trading figures of all UK members of the group.",
          "If your organisation is based in the Channel Islands or Isle of Man, you should include only the subsidiaries that are located there (do not include subsidiaries that are in the UK).",
        ],
      )
    end

    # Required figures
    def required_figures_company
      OpenStruct.new(
        header: "Required figures",
        context: [
          "We ask you to provide figures for your five most recent financial years. If you started trading within the last five years, you only need to provide figures for the years you have been trading. However, to meet minimum eligibility requirements, you must be able to provide figures for at least your two most recent financial years, covering the full 24 months.",
          "If you haven't reached your latest year-end, please use estimates to complete these questions.",
        ],
      )
    end

    def required_figures_innovation
      OpenStruct.new(
        header: "Required figures",
        context: [
          "We ask you to provide figures for your five most recent financial years. If the innovation has been in the market for less than five years, you only need to provide figures for the years it was in the market. However, to meet minimum eligibility requirements, you must be able to provide figures for at least your two most recent financial years, covering the full 24 months.",
          "If you haven't reached your latest year-end, please use estimates to complete these questions.",
        ],
      )
    end

    def required_figures_trade
      OpenStruct.new(
        header: "Required figures",
        context: [
          'If you have selected "Outstanding Short-Term Growth" in D1, you will only need to provide information for the last three years.',
          "If you haven't reached your latest year-end, please use estimates to complete these questions.",
        ],
      )
    end

    # Figures format
    def figures_format
      OpenStruct.new(
        header: "Figures - format",
        context: [
          "You must enter financial figures in pounds sterling (£).<br>
          Round the figures to the nearest pound (do not enter pennies).<br>
          Do not separate your figures with commas.<br>
          Use a minus symbol to record any losses.<br>
          Enter '0' if you had none.",
        ],
      )
    end

    # D6
    def about_D6
      OpenStruct.new(
        header: "About D6 questions",
        context: [
          "Some of the details may not apply to your innovation. Answer the questions that are relevant to help us understand the financial value of your innovation.",
        ],
      )
    end
    ######## Section D ########

    ######## Section E ########

    def about_section_E
      OpenStruct.new(
        header: "About section E",
        context: [
          "The environmental, social, and corporate governance (ESG) section is an opportunity for you to highlight your responsible business conduct and its impact within your organisation, supply chain and the wider community.",
          "We expect all King's Award for Enterprise applicants to adhere to commonly accepted standards for environmentally and socially responsible corporate governance. Failure to demonstrate that will result in your application not being successful.",
        ],
      )
    end

    # Answering questions
    def answering_questions
      OpenStruct.new(
        header: "Answering questions",
        context: [
          "Provide examples for each question relative to the size and scale of your business.",
          "The word limits are a guide. You do not need to maximise the word limit if there is no reason to - we suggest you focus on your strongest examples in each case.",
          "Furthermore, you may have already answered some of the questions in this section in other parts of the form. If you believe this is the case, you do not need to repeat the information but make it clear by referencing the questions in other parts of the form.",
          "The guidance notes below each section are not exhaustive. Where possible, please support your answers with quantitative evidence of your initiatives, improvements and successes, and describe any relevant policies or procedures that you have in place.",
          "Finally, there is no need to provide information on how you are adhering to statutory laws or regulations - such as 'we pay minimum wage'. We're more interested in how you are going above and beyond.",
        ],
      )
    end
  end

  ######## Section E ########

  class AboutSectionQuestion < HeaderQuestion
  end
end
