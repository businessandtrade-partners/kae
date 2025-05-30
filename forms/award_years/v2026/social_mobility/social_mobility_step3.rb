class AwardYears::V2026::QaeForms
  class << self
    def mobility_step3
      @mobility_step3 ||= proc do
        about_section :dmobility_c_section_header, "" do
          section "your_social_mobility"
        end

        header :initiative_header_c1, "Your social mobility in relation to your whole organisation" do
          ref "C 1"
          context %(
            <p class="govuk-body">Social mobility is a measure of the ability to move from a lower socio-economic background to higher socio-economic status.</p>
            <ul class="govuk-list govuk-list--bullet">
              <li>
                Socio-economic background is a set of social and economic circumstances from which a person has come.
              </li>
              <li>
                Socio-economic status is a person's current social and economic circumstances.
              </li>
            </ul>
            <p class="govuk-body">This award is for organisations that are choosing to support social mobility as a discretionary activity (rather than those for whom it is their core activity). Commercial organisations, not-for-profits, social enterprises and charities are welcome to apply.</p>
            <p class="govuk-body">Where an enterprise has established a subsidiary, the principal activity of which is to promote social mobility, such subsidiaries are eligible.</p>

            <details class='govuk-details govuk-!-margin-top-3 govuk-!-margin-bottom-0' data-module="govuk-details">
            <summary class="govuk-details__summary">
              <span class="govuk-details__summary-text">
                See examples of eligible organisations and circumstances:
              </span>
            </summary>
            <div class="govuk-details__text">
              <p class="govuk-body">An organisation that supports social mobility as a discretionary activity (social mobility is not its core activity)</p>
              <ul class="govuk-list govuk-list--bullet">
                <li>An apprenticeship scheme by an SME or charity with a target of some of these apprentices to be from a disadvantaged socio-economic background, with the aim of most of those apprentices going into employment after the apprenticeship ends.</li>
                <li>A recruitment initiative by a large corporation that aims to have a certain number of recruits from disadvantaged backgrounds.</li>
                <li>A construction company that provides members of its workforce from disadvantaged backgrounds opportunities to improve their skills and advance their careers through academic and other exercises such as mentoring or work placements.</li>
                <li>A charity helping its own employees from less-advantaged backgrounds to secure managerial roles.</li>
              </ul>

              <p class="govuk-body">A subsidiary with the principal activity of promoting social mobility. However, social mobility is not their parent organisation’s core activity.</p>
              <ul class="govuk-list govuk-list--bullet">
                <li>A subsidiary of a large retail chain where the subsidiary was created to run a retailer’s apprenticeship scheme with priority given to people from disadvantaged backgrounds and with disabilities.</li>
              </ul>

              <p class="govuk-body">An organisation whose core activity is to improve social mobility and who: i\) are making a joint application with one or more businesses, and all the partners will submit separate applications; or ii\) have a social mobility initiative for our own workforce.</p>
              <ul class="govuk-list govuk-list--bullet">
                <li>A school, college, university, or private training provider that provides skills training, education for its own employees from disadvantaged groups</li>
                <li>A charity that supports its own workforce from disadvantaged backgrounds through mentorship, work placements and campaigning.</li>
                <li>A school, college, university or private training provider who is submitting a joint application with a business about a programme or intervention it has created or implemented in partnership.</li>
              </ul>
            </div>
            </details>
            <details class='govuk-details govuk-!-margin-top-3 govuk-!-margin-bottom-0' data-module="govuk-details">
              <summary class="govuk-details__summary">
                <span class="govuk-details__summary-text">
                  See examples of ineligible organisations and circumstances:
                </span>
              </summary>
              <div class="govuk-details__text">
                <p class="govuk-body">
                  Organisations whose core activity is to improve social mobility and who are applying for this award on the basis of their core activity are <strong>not eligible</strong>. For example:
                </p>
                <ul class="govuk-list govuk-list--bullet">
                  <li>A school, college, university, or private training provider that provides skills training or education and are applying on the basis of the training that they provide for people from disadvantaged groups.</li>
                  <li>A charity that supports people from disadvantaged backgrounds through mentorship, work placements and campaigning and is applying on the basis of that work.</li>
                </ul>
              </div>
            </details>
          )

          pdf_context_with_header_blocks [
            [:normal, %(
              Social mobility is a measure of the ability to move from a lower socio-economic background to higher socio-economic status.

              \u2022 Socio-economic background is a set of social and economic circumstances from which a person has come.

              \u2022 Socio-economic status is a person's current social and economic circumstances.

              This award is for organisations that are choosing to support social mobility as a discretionary activity (rather than those for whom it is their core activity). Commercial organisations, not-for-profits, social enterprises and charities are welcome to apply.

              Where an enterprise has established a subsidiary, the principal activity of which is to promote social mobility, such subsidiaries are eligible.

              See examples of eligible organisations and circumstances:

              An organisation that supports social mobility as a discretionary activity (social mobility is not its core activity)

              \u2022 An apprenticeship scheme by an SME or charity with a target of some of these apprentices to be from a disadvantaged socio-economic background, with the aim of most of those apprentices going into employment after the apprenticeship ends.

              \u2022 A recruitment initiative by a large corporation that aims to have a certain number of recruits from disadvantaged backgrounds.

              \u2022 A construction company that provides members of its workforce from disadvantaged backgrounds opportunities to improve their skills and advance their careers through academic and other exercises such as mentoring or work placements.

              \u2022 A charity helping its own employees from less-advantaged backgrounds to secure managerial roles.

              A subsidiary with the principal activity of promoting social mobility. However, social mobility is not their parent organisation’s core activity.

              \u2022 A subsidiary of a large retail chain where the subsidiary was created to run a retailer’s apprenticeship scheme with priority given to people from disadvantaged backgrounds and with disabilities.

              An organisation whose core activity is to improve social mobility and who: i\) are making a joint application with one or more businesses, and all the partners will submit separate applications; or ii\) have a social mobility initiative for our own workforce.

              \u2022 A school, college, university, or private training provider that provides skills training, education for its own employees from disadvantaged groups

              \u2022 A charity that supports its own workforce from disadvantaged backgrounds through mentorship, work placements and campaigning.

              \u2022 A school, college, university or private training provider who is submitting a joint application with a business about a programme or intervention it has created or implemented in partnership.

              See examples of ineligible organisations and circumstances:

              Organisations whose core activity is to improve social mobility and who are applying for this award on the basis of their core activity are <strong>not eligible</strong>. For example:

              \u2022 A school, college, university, or private training provider that provides skills training or education and are applying on the basis of the training that they provide for people from disadvantaged groups.

              \u2022 A charity that supports people from disadvantaged backgrounds through mentorship, work placements and campaigning and is applying on the basis of that work.
            )],
          ]
        end

        options :mobility_in_relation_to_organisation, "Select a statement that best describes your social mobility in relation to your whole organisation:" do
          required
          ref "C 1.1"
          classes "conditional-select-statement"

          option "discretionary_activity", "a) We have an initiative that supports social mobility as a discretionary activity (social mobility is not our core activity)."
          option "principle_activity", "b) We are a subsidiary with the principal activity of promoting social mobility. However, social mobility is not our parent organisation’s core activity."
          option "joint_application_or_workforce_initiative", "c) We are an organisation whose core activity is to improve social mobility, and we: i) are making a joint application with one or more businesses, and all the partners will submit separate applications; or ii) have a social mobility initiative for our own workforce."
          option "core_activity", "d) We are an organisation whose core activity is to improve social mobility, and we are applying for this award on the basis of our core activity."

          ineligible_option "core_activity"

          pdf_context_with_header_blocks [
            [:italic, "If you have selected option D, you are not eligible to apply for this award. Organisations whose core activity is to improve social mobility (including all education and training providers) are not eligible if applying based on business-as-usual activities. As an enterprise award, it is focused on recognising social mobility initiatives that are discretionary or that are in partnership with businesses for whom it is discretionary."],
          ]
        end

        checkbox_seria :initiative_activities, "What type of activities does your initiative focus on to make a positive impact by promoting opportunity through social mobility?" do
          ref "C 2"
          required
          classes "question-limited-selections"
          context %(
            <p>If necessary, you can select more than one activity.</p>
          )
          check_options [
            ["careers_advice", "<strong>Careers advice</strong> - providing careers advice or information to help people from disadvantaged backgrounds make more informed career choices as part of your recruitment initiatives such as traineeships, internships, apprenticeships or graduate schemes."],
            ["fairer_recruitment", "<strong>Fairer recruitment</strong> - widening your recruitment pool and making your recruitment process fairer by assessing potential skills rather than background - socio-economic or academic."],
            ["skills_development", "<strong>Skills development</strong> - providing activities or training to help people from disadvantaged backgrounds to develop hard skills (for example, numeracy, computer literacy, cooking) or soft skills (for example, workplace communication, effective workplace relationship development). This may include the development of aspirations and increasing motivation."],
            ["work_placements", "<strong>Work placements</strong> - preparing people from disadvantaged backgrounds for the world of work through inspiring work experiences and internships."],
            ["early_careers", "<strong>Early careers</strong> - fostering a youth-friendly culture in your workplace where younger employees from disadvantaged backgrounds are invested in and developed to progress in their careers."],
            ["job_opportunities", "<strong>Job opportunities</strong> - broadening access to job opportunities by creating accessible routes to employment. This could be by providing jobs for people from disadvantaged backgrounds who are leaving school, college, university or prisons, for example, through quality traineeships, internships, apprenticeships or graduate schemes."],
            ["advancement", "<strong>Advancement</strong> - developing career paths to senior positions for those from disadvantaged backgrounds and tracking the progress of employees from non-graduate routes."],
            ["advocacy_and_leadership", "<strong>Advocacy and leadership</strong> - demonstrating strong external leadership or advocacy promoting social mobility within and beyond your organisation. For example, by getting more staff involved in efforts to improve social mobility by encouraging supply chains to take action on social mobility."],
            ["other_activity_types", "<strong>Other activity types - list the activities in C2.1</strong>"],
          ]
        end

        textarea :initiative_activities_other_specify, "Please list other activity types" do
          required
          classes "sub-question js-conditional-question-checkbox text-words-max"
          sub_ref "C 2.1"
          conditional :initiative_activities, "other_activity_types"
          words_max 50
          rows 2
        end

        header :initiative_header_c3, "Summary of your promoting opportunity through social mobility initiative." do
          ref "C 3"
        end

        textarea :initiative_desc_short, "Provide a one-line description of your initiative." do
          classes "sub-question text-words-max"
          sub_ref "C 3.1"
          required
          context %(
            <p>This description will be used in publicity material if your application is successful.</p>
            <p>Some good examples from previously shortlisted organisations:</p>
            <ul>
              <li>X unleashes potential through direct employment - removing barriers to work, developing people and strengthening communities.</li>
              <li>As a physical and social regeneration business, promoting opportunity is central to X’s activities.</li>
              <li>X programme helps people into meaningful work after prison, homelessness or other significant personal challenges.</li>
            </ul>
          )
          words_max 15
        end

        textarea :initiative_desc_medium, "Briefly describe the initiative, its aims, what it provides and how it promotes opportunity through social mobility." do
          classes "sub-question text-words-max"
          sub_ref "C 3.2"
          required
          words_max 300
        end

        textarea :initiative_motivations, "Outline the factors or issues that motivated your organisation to provide the initiative." do
          classes "sub-question text-words-max"
          sub_ref "C 3.3"
          required
          context %(
            <p>Please include details on:</p>

            <ul>
              <li>When was the initiative started?</li>
              <li>What was the situation before the inception of this initiative?</li>
              <li>What were the issues or needs of the potential participants?</li>
              <li>Why did you choose this particular initiative?</li>
              <li>How does this initiative align with the core aims and values of your organisation?</li>
            </ul>
          )
          words_max 500
        end

        textarea :initiative_exemplary_evidence, "Describe what makes your initiative exemplary." do
          classes "sub-question text-words-max"
          sub_ref "C 3.4"
          required
          context %(
            <p>Taking into account your mission, values and strategic objectives, describe how and why your initiative stands out from others to promote opportunity through social mobility to disadvantaged groups.</p>

            <p>For example, you may feel your approach to bringing key people together and how you have created, improved and influenced your initiative sets you apart from your peers. If you have led the way by doing something that has never been done before, please provide evidence of what you did and how you did this.</p>

            <p>Your initiative may be exemplary as a result of a strategy to inform, guide, recruit and develop people, or you may have formed effective partnerships and collaborations with organisations, bringing them together to support diversity and inclusion. It is important to provide evidence of how you did this.</p>

            <p>Highlight if your initiative has two-fold benefits – it helps the participants by addressing the socio-economic barriers to employment as well as having a positive impact across the whole organisation.</p>
          )
          words_max 500
        end

        textarea :initiative_evidence_exemplary, "Provide evidence of what makes your initiative exemplary." do
          sub_ref "C 3.5"
          required
          classes "sub-question text-words-max"
          words_max 200
          context %(
            <p>To support your answer in C3.4, provide <strong>third-party evidence</strong> of what makes your initiative exemplary compared to other similar initiatives and how you are going 'above and beyond' compared to your sector. For example, provide links to independent evaluation reports, details of awards won, client feedback ratings and how that compares with other similar organisations.</p>
          )
        end

        textarea :initiative_day_to_day_running, "Who is responsible for and who runs the initiative day-to-day?" do
          classes "sub-question text-words-max"
          sub_ref "C 3.6"
          required
          words_max 200
          context %(
            <p>Provide their title and describe their overall role in the organisation as well as involvement with the initiative.</p>
          )
        end

        textarea :goals_targets_monitor, "Describe what goals or targets you set and how you monitor them in the context of your initiative." do
          classes "question text-words-max"
          ref "C 4"
          required
          words_max 500
          context %(
            <p><em>Your goals or targets should be aligned with the types of activities you listed in C2 as well as the impact you will demonstrate in C5 questions.</em></p>
            <ul>
              <li>Provide information on what goals or targets you set for your initiative and how these are determined.</li>
              <li>Explain how you monitor performance against the goals or targets.</li>
              <li>Explain what evidence you gather to show short and longer-term outcomes against these goals or targets – this may include but is not limited to internal records, third-party evidence, survey responses, interviews, ad-hoc feedback.</li>
            </ul>
          )

          pdf_context_with_header_blocks [
            [:italic, "Your goals or targets should be aligned with the types of activities you listed in C2 as well as the impact you will demonstrate in C5 questions."],
            [:normal, %(
              \u2022 Provide information on what goals or targets you set for your initiative and how these are determined.

              \u2022 Explain how you monitor performance against the goals or targets.

              \u2022 Explain what evidence you gather to show short and longer-term outcomes against these goals or targets – this may include but is not limited to internal records, third-party evidence, survey responses, interviews, ad-hoc feedback.)],
          ]
        end

        textarea :goals_targets_compare, "Describe how the goals or targets you set compare to the outcomes." do
          classes "sub-question text-words-max"
          sub_ref "C 4.1"
          required
          words_max 200
          context %(
            <p>It is important that you demonstrate how the goals or targets you set compare to the outcomes you provide in C5 questions. Do you meet them, exceed them, or are there some shortfalls?</p>
          )
        end

        textarea :addressing_shortfalls, "Explain any shortfalls and if you do anything to address them." do
          classes "sub-question text-words-max"
          sub_ref "C 4.2"
          required
          words_max 200
          context %(
            <p>Explain reasons why shortfalls occur. Are you able to address these? If so, what do you do to address them?</p>
          )
        end

        header :disadvantaged_participants_header, "The impact on participants." do
          ref "C 5"
          context %(
            <p class="govuk-body">For the purpose of this application, the disadvantaged participants are as defined in the list under “Disadvantaged groups" at the start of this section.</p>

            <p class="govuk-body">Your answer should consider the goals or targets that you have outlined in question C4.</p>

            <p class="govuk-body">Please note that to be eligible for the award, the participants must be based in the UK and be over 16 years old at the start of the engagement with your initiative. If your organisation is based in the Channel Islands or Isle of Man, for the purpose of this award application, you should count only the participants who are located there (do not count participants who are in the UK).</p>

            <p class="govuk-body">A participant may fit into more than one disadvantaged group category or activity type - you can count them more than once by including them in each relevant category. However, <strong>when you count the total, only count them once.</strong></p>

            <p class="govuk-body">Provide totals for at least the last two years (full 24 months) and no more than the last five years. Please cover the same number of years in all your answers to ensure consistency across all of them.</p>
          )
        end

        matrix :disadvantaged_participants_numbers, "Number of participants that are supported by your organisation" do
          classes "sub-question question-matrix"
          ref "C 5.1"
          required
          context %(
            <p><em>You must answer C2 before answering this question. Also, please refer to the guidance under C5.</em></p>
            <p>
              If none, please enter "0".
            </p>
          )
          pdf_context_with_header_blocks [
            [:italic, "You must answer C2 before answering this question. Also, please refer to the guidance under C5."],
            [:normal, "If none, please enter '0'."],
          ]

          auto_totals_column true
          corner_label "Participants"
          totals_label "Total number of participants supported (the system will calculate this)"
          others_label "Others receiving support from you who are not disadvantaged"
          proportion_label "The proportion of disadvantaged participants supported from the total (the system will calculate this)"

          x_headings [2020, 2021, 2022, 2023, 2024, "Total (system calculated)"]

          y_headings [
            ["total_disadvantaged", "Total number of disadvantaged participants supported"],
          ]
          column_widths({ 1 => 13, 2 => 13, 3 => 13, 4 => 13, 5 => 13, 6 => 13 })
        end

        matrix :disadvantaged_participants_activity_type, "Provide the number of disadvantaged participants in each activity type that your initiative supports each year." do
          classes "sub-question question-matrix"
          ref "C 5.2"
          required
          required_rows :initiative_activities, hide_unchecked: true
          context %(
            <p><em>You must answer C2 before answering this question. Also, please refer to the guidance under C5.</em></p>
            <p>
              If none, please enter "0".
            </p>
          )
          pdf_context_with_header_blocks [
            [:italic, "You must answer C2 before answering this question. Also, please refer to the guidance under C5."],
            [:normal, "If none, please enter '0'."],
          ]
          corner_label "Activity type"

          x_headings [2020, 2021, 2022, 2023, 2024]

          y_headings [
            ["careers_advice", "Careers advice"],
            ["fairer_recruitment", "Fairer recruitment"],
            ["skills_development", "Skills development"],
            ["work_placements", "Work placements"],
            ["early_careers", "Early careers"],
            ["job_opportunities", "Job opportunities"],
            ["advancement", "Advancement"],
            ["advocacy_and_leadership", "Advocacy and leadership"],
            ["other_activity_types", "Other activity types (as listed in C2.1)"],
          ]
          column_widths({ 1 => 16, 2 => 16, 3 => 16, 4 => 16, 5 => 16 })
        end

        checkbox_seria :disadvantaged_participants, "What disadvantaged groups does your initiative support?" do
          classes "question-limited-selections"
          sub_ref "C 5.3"
          required
          context %(
            <p><em>Select all that apply.</em></p>
          )
          check_options [
            ["ethnic", "Black, Asian and minority ethnic people, including Gypsy and Traveller people"],
            ["refugees", "Asylum seekers and refugees or children of refugees"],
            ["young_language", "Young people (over 16 years old) with English as a second language"],
            ["living_situation", "Long-term unemployed or people who grew up in workless households"],
            ["people_low_incomes", "People on low incomes"],
            ["lone_parents", "Lone parents - single adult heads of a household who are responsible for at least one dependent child, who normally lives with them"],
            ["free_meals", "People who received free school meals or if there are children in the person’s current household who receive free school meals"],
            ["homeless_insecurely_housed", "Homeless and insecurely housed, including those at risk of becoming homeless and those in overcrowded or substandard housing"],
            ["care_leavers", "Care leavers - people who spent time in care before the age of 18. Such care could be in foster care, children's homes, or other arrangements outside the immediate or extended family"],
            ["young_education", "Young people (over 16 years old) who are not in education, employment or training (NEET) or are at risk of that"],
            ["school_attainment", "People who attended schools with lower-than-average attainment or if there are children in the person’s current household who attend school with lower-than-average attainment"],
            ["parents_qualification", "People whose parents’ or guardians’ highest level of qualifications by the time the person was 18 was a secondary school"],
            ["mental_disability", "People with a physical or mental disability that has a substantial and adverse long- term effect on a person’s ability to do normal daily activities"],
            ["recovered", "People recovering or who have recovered from addiction "],
            ["domestic_violence", "Survivors of domestic violence"],
            ["military_veterans", "Military veterans"],
            ["ex_offenders", "Ex-offenders"],
            ["families_prisoners", "Families of prisoners"],
            ["others", "Other disadvantaged group"],
          ]
        end

        matrix :disadvantaged_participants_in_group_year, "Provide the number of participants in each disadvantaged group where your initiative has resulted in employment opportunities." do
          classes "sub-question question-matrix"
          sub_ref "C 5.4"
          required
          required_rows :disadvantaged_participants, hide_unchecked: true
          context %(
            <p><em>You must answer C5.3 before answering this question. Also, please refer to the guidance under C5.</em></p>
            <p>
              If none, please enter "0".
            </p>
          )
          pdf_context_with_header_blocks [
            [:italic, "You must answer C5.3 before answering this question. Also, please refer to the guidance under C5."],
            [:normal, "If none, please enter '0'."],
          ]
          corner_label "Disadvantaged group type"
          subtotals_label "Subtotal number of discrete disadvantaged participants who benefited (the system will calculate this)"
          others_label "Others receiving support from you who are not disadvantaged who benefited"
          totals_label "Total number of discrete participants (the system will calculate this)"
          proportion_label "The proportion of disadvantaged participants from the total (the system will calculate this)"

          x_headings [2020, 2021, 2022, 2023, 2024]

          y_headings [
            ["ethnic", "Black, Asian and minority ethnic people, including Gypsy and Traveller people"],
            ["refugees", "Asylum seekers and refugees or children of refugees"],
            ["young_language", "Young people (over 16 years old) with English as a second language"],
            ["living_situation", "Long-term unemployed or people who grew up in workless households"],
            ["people_low_incomes", "People on low incomes"],
            ["lone_parents", "Lone parents - single adult heads of a household who are responsible for at least one dependent child, who normally lives with them"],
            ["free_meals", "People who received free school meals or if there are children in the person’s current household who receive free school meals"],
            ["homeless_insecurely_housed", "Homeless and insecurely housed, including those at risk of becoming homeless and those in overcrowded or substandard housing"],
            ["care_leavers", "Care leavers - people who spent time in care before the age of 18. Such care could be in foster care, children's homes, or other arrangements outside the immediate or extended family"],
            ["young_education", "Young people (over 16 years old) who are not in education, employment or training (NEET) or are at risk of that"],
            ["school_attainment", "People who attended schools with lower-than-average attainment or if there are children in the person’s current household who attend school with lower-than-average attainment"],
            ["parents_qualification", "People whose parents’ or guardians’ highest level of qualifications by the time the person was 18 was a secondary school"],
            ["mental_disability", "People with a physical or mental disability that has a substantial and adverse long- term effect on a person’s ability to do normal daily activities"],
            ["recovered", "People recovering or who have recovered from addiction "],
            ["domestic_violence", "Survivors of domestic violence"],
            ["military_veterans", "Military veterans"],
            ["ex_offenders", "Ex-offenders"],
            ["families_prisoners", "Families of prisoners"],
            ["others", "Other disadvantaged group"],
          ]
          column_widths({ 1 => 16, 2 => 16, 3 => 16, 4 => 16, 5 => 16 })
        end

        textarea :disadvantaged_group_not_in_list, "If you are putting forward a group that is not on this list, please provide details and explain why you believe the group you support should be considered disadvantaged." do
          sub_ref "C 5.4.1"
          classes "text-words-max"
          context %(
            <p><em>
              Answer this question if you provided numbers for 'Other disadvantaged group' in question C5.4.
            </em></p>
          )
          words_max 300
        end

        matrix :disadvantaged_groups_impact_employment, "Provide the number of participants in each disadvantaged group where your initiative has resulted in educational opportunities." do
          classes "sub-question question-matrix"
          sub_ref "C 5.5"
          required
          required_rows :disadvantaged_participants, hide_unchecked: true
          context %(
            <p><em>You must answer C5.3 before answering this question. Also, please refer to the guidance under C5.</em></p>
            <p>
              If none, please enter "0".
            </p>
          )
          pdf_context_with_header_blocks [
            [:italic, "You must answer C5.3 before answering this question. Also, please refer to the guidance under C5."],
            [:normal, "If none, please enter '0'."],
          ]
          corner_label "Disadvantaged group type"
          subtotals_label "Subtotal number of discrete disadvantaged participants who benefited (the system will calculate this)"
          others_label "Others receiving support from you who are not disadvantaged who benefited"
          totals_label "Total number of discrete participants (the system will calculate this)"
          proportion_label "The proportion of disadvantaged participants from the total (the system will calculate this)"

          x_headings ["Jobs secured during the support or within a year after support ending", "Jobs retained for more than one year", "Apprenticeships secured", "Apprenticeships completed"]

          y_headings [
            ["ethnic", "Black, Asian and minority ethnic people, including Gypsy and Traveller people"],
            ["refugees", "Asylum seekers and refugees or children of refugees"],
            ["young_language", "Young people (over 16 years old) with English as a second language"],
            ["living_situation", "Long-term unemployed or people who grew up in workless households"],
            ["people_low_incomes", "People on low incomes"],
            ["lone_parents", "Lone parents - single adult heads of a household who are responsible for at least one dependent child, who normally lives with them"],
            ["free_meals", "People who received free school meals or if there are children in the person’s current household who receive free school meals"],
            ["homeless_insecurely_housed", "Homeless and insecurely housed, including those at risk of becoming homeless and those in overcrowded or substandard housing"],
            ["care_leavers", "Care leavers - people who spent time in care before the age of 18. Such care could be in foster care, children's homes, or other arrangements outside the immediate or extended family"],
            ["young_education", "Young people (over 16 years old) who are not in education, employment or training (NEET) or are at risk of that"],
            ["school_attainment", "People who attended schools with lower-than-average attainment or if there are children in the person’s current household who attend school with lower-than-average attainment"],
            ["parents_qualification", "People whose parents’ or guardians’ highest level of qualifications by the time the person was 18 was a secondary school"],
            ["mental_disability", "People with a physical or mental disability that has a substantial and adverse long- term effect on a person’s ability to do normal daily activities"],
            ["recovered", "People recovering or who have recovered from addiction "],
            ["domestic_violence", "Survivors of domestic violence"],
            ["military_veterans", "Military veterans"],
            ["ex_offenders", "Ex-offenders"],
            ["families_prisoners", "Families of prisoners"],
            ["other_disadvantaged_group", "Other disadvantaged group"],
          ]
          column_widths({ 1 => 20, 2 => 20, 3 => 23, 4 => 23 })
        end

        textarea :disadvantaged_groups_impact_employment_explained, "If, in question C5.5, jobs retained for more than a year are significantly lower than those secured during the support or within a year of support ending, please explain why." do
          classes "sub-question text-words-max"
          sub_ref "C 5.5.1"
          required
          words_max 150
        end

        matrix :disadvantaged_groups_impact_education, "Provide the number of participants in each disadvantaged group that your initiative resulted in educational opportunities for them." do
          classes "sub-question question-matrix"
          sub_ref "C 5.6"
          required
          required_rows :disadvantaged_participants, hide_unchecked: true
          context %(
            <p><em>You must answer C5.3 before answering this question. Also, please refer to the guidance under C5.</em></p>
            <p>
              If none, please enter "0".
            </p>
          )
          pdf_context_with_header_blocks [
            [:italic, "You must answer C5.3 before answering this question. Also, please refer to the guidance under C5."],
            [:normal, "If none, please enter '0'."],
          ]
          corner_label "Disadvantaged group type"
          subtotals_label "Subtotal number of discrete disadvantaged participants who benefited (the system will calculate this)"
          others_label "Others receiving support from you who are not disadvantaged who benefited"
          totals_label "Total number of discrete participants supported (the system will calculate this)"
          proportion_label "The proportion of disadvantaged participants from the total (the system will calculate this)"

          x_headings ["NVQ levels 1-3", "NVQ level 4 and above", "GCSEs	A levels", "Entrance to Further Education	", "Entrance to Higher Education"]

          y_headings [
            ["ethnic", "Black, Asian and minority ethnic people, including Gypsy and Traveller people"],
            ["refugees", "Asylum seekers and refugees or children of refugees"],
            ["young_language", "Young people (over 16 years old) with English as a second language"],
            ["living_situation", "Long-term unemployed or people who grew up in workless households"],
            ["people_low_incomes", "People on low incomes"],
            ["lone_parents", "Lone parents - single adult heads of a household who are responsible for at least one dependent child, who normally lives with them"],
            ["free_meals", "People who received free school meals or if there are children in the person’s current household who receive free school meals"],
            ["homeless_insecurely_housed", "Homeless and insecurely housed, including those at risk of becoming homeless and those in overcrowded or substandard housing"],
            ["care_leavers", "Care leavers - people who spent time in care before the age of 18. Such care could be in foster care, children's homes, or other arrangements outside the immediate or extended family"],
            ["young_education", "Young people (over 16 years old) who are not in education, employment or training (NEET) or are at risk of that"],
            ["school_attainment", "People who attended schools with lower-than-average attainment or if there are children in the person’s current household who attend school with lower-than-average attainment"],
            ["parents_qualification", "People whose parents’ or guardians’ highest level of qualifications by the time the person was 18 was a secondary school"],
            ["mental_disability", "People with a physical or mental disability that has a substantial and adverse long- term effect on a person’s ability to do normal daily activities"],
            ["recovered", "People recovering or who have recovered from addiction "],
            ["domestic_violence", "Survivors of domestic violence"],
            ["military_veterans", "Military veterans"],
            ["ex_offenders", "Ex-offenders"],
            ["families_prisoners", "Families of prisoners"],
            ["other_disadvantaged_group", "Other disadvantaged group"],
          ]
          column_widths({ 1 => 20, 2 => 25, 3 => 20, 4 => 23, 5 => 23 })
        end

        matrix :disadvantaged_groups_opportunities_numbers, "Provide the number of participants in each disadvantaged group that your initiative resulted in other opportunities for them." do
          classes "sub-question question-matrix"
          sub_ref "C 5.7"
          required
          required_rows :disadvantaged_participants, hide_unchecked: true
          context %(
            <p><em>You must answer C5.3 before answering this question. Also, please refer to the guidance under C5.</em></p>
            <p>
              If none, please enter "0".
            </p>
          )
          pdf_context_with_header_blocks [
            [:italic, "You must answer C5.3 before answering this question. Also, please refer to the guidance under C5."],
            [:normal, "If none, please enter '0'."],
          ]
          corner_label "Disadvantaged group type"
          subtotals_label "Subtotal number of discrete disadvantaged participants who benefited (the system will calculate this)"
          others_label "Others receiving support from you who are not disadvantaged who benefited"
          totals_label "Total number of discrete participants supported (the system will calculate this)"
          proportion_label "The proportion of disadvantaged participants from the total (the system will calculate this)"

          x_headings ["Internships",	"Payment of living wage",	"Businesses started",	"Housing secured", "Other"]

          y_headings [
            ["ethnic", "Black, Asian and minority ethnic people, including Gypsy and Traveller people"],
            ["refugees", "Asylum seekers and refugees or children of refugees"],
            ["young_language", "Young people (over 16 years old) with English as a second language"],
            ["living_situation", "Long-term unemployed or people who grew up in workless households"],
            ["people_low_incomes", "People on low incomes"],
            ["lone_parents", "Lone parents - single adult heads of a household who are responsible for at least one dependent child, who normally lives with them"],
            ["free_meals", "People who received free school meals or if there are children in the person’s current household who receive free school meals"],
            ["homeless_insecurely_housed", "Homeless and insecurely housed, including those at risk of becoming homeless and those in overcrowded or substandard housing"],
            ["care_leavers", "Care leavers - people who spent time in care before the age of 18. Such care could be in foster care, children's homes, or other arrangements outside the immediate or extended family"],
            ["young_education", "Young people (over 16 years old) who are not in education, employment or training (NEET) or are at risk of that"],
            ["school_attainment", "People who attended schools with lower-than-average attainment or if there are children in the person’s current household who attend school with lower-than-average attainment"],
            ["parents_qualification", "People whose parents’ or guardians’ highest level of qualifications by the time the person was 18 was a secondary school"],
            ["mental_disability", "People with a physical or mental disability that has a substantial and adverse long- term effect on a person’s ability to do normal daily activities"],
            ["recovered", "People recovering or who have recovered from addiction "],
            ["domestic_violence", "Survivors of domestic violence"],
            ["military_veterans", "Military veterans"],
            ["ex_offenders", "Ex-offenders"],
            ["families_prisoners", "Families of prisoners"],
            ["other_disadvantaged_group", "Other disadvantaged group"],
          ]
          column_widths({ 1 => 25, 2 => 20, 3 => 23, 4 => 20, 5 => 15 })
        end

        textarea :disadvantaged_groups_numbers_explained, "Explain how you collected the impact numbers." do
          classes "sub-question text-words-max"
          sub_ref "C 5.8"
          required
          context %(
            <p>This may include but is not limited to internal records, third-party evidence, survey responses.</p>
          )
          words_max 150
        end

        textarea :initiative_qualitative_impact, "Provide qualitative evidence on the impact that your initiative has achieved for your participants." do
          classes "sub-question text-words-max"
          sub_ref "C 5.9"
          required
          context %(
            <p>Provide qualitative data (for example, people’s stories as well as comments, feedback from participants and key stakeholders) that shows how your initiative has brought about meaningful change or improved the employability and sustainability of the participants and how it has raised their career aspirations and confidence.</p>
            <ul>
              <li>Include stories of impact on participants’ lives. If possible, provide a range of examples.</li>
              <li>Include feedback, such as quotes, that you have gathered from participants to understand how they have benefited.</li>
              <li>If applicable, include feedback that you have gathered from third-party stakeholders to understand how the participants have benefited. </li>
              <li>Explain where the qualitative evidence comes from - this may include but is not limited to third-party independent evaluation reports, surveys, interviews or ad-hoc feedback.</li>
            </ul>
          )
          pdf_context %(
            Provide qualitative data (for example, people’s stories as well as comments, feedback from participants and key stakeholders) that shows how your initiative has brought about meaningful change or improved the employability and sustainability of the participants and how it has raised their career aspirations and confidence.

            \u2022 Include stories of impact on participants’ lives. If possible, provide a range of examples.

            \u2022 Include feedback, such as quotes, that you have gathered from participants to understand how they have benefited.

            \u2022 If applicable, include feedback that you have gathered from third-party stakeholders to understand how the participants have benefited.

            \u2022 Explain where the qualitative evidence comes from - this may include but is not limited to third-party independent evaluation reports, surveys, interviews or ad-hoc feedback.
          )
          words_max 750
        end

        textarea :initiative_feedback, "Describe what feedback, if any, you sought on how your initiative could be improved. What, if any, of the suggested improvements have you implemented?" do
          classes "sub-question text-words-max"
          sub_ref "C 5.10"
          required
          context %(
            <ul>
              <li>Explain how you sought feedback.</li>
              <li>Include a summary of the feedback gathered, such as participant or third-party stakeholder quotes as well as quantitative data, for example, scores on how likely they are to recommend the organisation to their peers or similar ratings.</li>
              <li>Explain what, if any, of the suggested improvements you have implemented.</li>
            </ul>
          )
          pdf_context %(
            \u2022 Explain how you sought feedback.

            \u2022 Include a summary of the feedback gathered, such as participant or third-party stakeholder quotes as well as quantitative data, for example, scores on how likely they are to recommend the organisation to their peers or similar ratings.

            \u2022 Explain what, if any, of the suggested improvements you have implemented.
          )
          words_max 250
        end

        header :initiative_header_c6, "Impact on your organisation." do
          ref "C 6"
        end

        textarea :initiative_impact_sharing, "Explain if and how you share and celebrate the evidence of the initiative’s impact across the organisation." do
          classes "sub-question text-words-max"
          sub_ref "C 6.1"
          required
          context %(
            <p>Please outline what mechanisms are in place to communicate the benefits of the initiative.</p>
          )
          words_max 200
        end

        textarea :initiative_member_engagement, "Explain if and how you engage the organisation’s members or workforce in the design and implementation of your initiative." do
          classes "sub-question text-words-max"
          sub_ref "C 6.2"
          required
          words_max 200
        end

        textarea :initiative_long_term_plans, "What are your long-term plans for ensuring your organisation continues to promote opportunities through social mobility beyond what you already do?" do
          classes "sub-question text-words-max"
          sub_ref "C 6.3"
          required
          words_max 200
        end

        textarea :initiative_organisation_benefits, "Are there any other benefits of the initiative to your organisation that you haven't yet outlined in the previous responses?" do
          classes "sub-question text-words-max"
          sub_ref "C 6.4"
          required
          context %(
            <p>This may include:</p>

            <p>Workforce relations - improvements in workforce motivation, well-being or satisfaction.</p>

            <p>Diversity - increased the ability to access and attract a wider talent pool.</p>

            <p>Reputation - increased positive perceptions of the organisation among key stakeholders - for example, customers and the media.</p>

            <p>Collaboration - best practices and learnings fed back into other departments; increased cross-departmental collaboration.</p>
          )
          words_max 300
        end

        textarea :initiative_community_society_impact, "Impact on community and society." do
          sub_ref "C 7"
          classes "text-words-max"
          required
          context %(
            <p>What is the impact of your initiative on the local community and at a regional and national level, and how is this exemplary?</p>
            <p>For example, has your initiative led to there being more people from disadvantaged backgrounds being in employment in your area that is higher than the national average? Has it increased recognition and awareness of these initiatives as a valid employment route? Has it led to higher employment outcomes regionally?</p>
          )
          words_max 300
        end

        textarea :initiative_investments, "Investments in the initiative" do
          sub_ref "C 8"
          classes "text-words-max"
          required
          question_sub_title %{
            List all investments and reinvestments (capital and operating costs) in your promoting opportunity through social mobility initiative. Include the years in which they were made.
          }
          words_max 400
        end
      end
    end
  end
end
