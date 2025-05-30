class AwardYears::V2026::QaeForms
  class << self
    def innovation_step6
      @innovation_step6 ||= proc do
        upload :innovation_materials, "Supplementary materials" do
          ref "F 1"
          context %(
            <p>
              If there are additional materials you feel would help us to assess your entry, you can add up to three files or online links in this section.
            </p>
            <h3 class="govuk-heading-s">
              What can and cannot be included:
            </h3>
            <ul class="govuk-hint govuk-list--bullet">
              <li>You <strong>can</strong> include links to promotional videos, websites, other media, or documents you feel are relevant and help illustrate your application.</li>
              <li>We <strong>will not</strong> consider business plans, annual accounts or company policy documents.</li>
            </ul>
            <h3 class="govuk-heading-s">
              Please note:
            </h3>
            <ul class="govuk-hint govuk-list--bullet">
              <li><strong>Essential information must be included within the form itself.</strong> Supplementary materials should only provide supporting content and should not contain key details that are required in your answers.</li>
              <li>For assessors to review the supporting material, you must reference them by their names in your answers. Please do so to ensure they are reviewed.</li>
              <li>Please do not combine documents and do not link to folders. Assessors have limited time to evaluate your application, so any additional documents should be kept short and relevant.</li>
            </ul>
            <p>
              You can submit up to 3 files in most formats if they are less than 5 megabytes each.
            </p>
          )
          pdf_context %(
            If there are additional materials you feel would help us to assess your entry, you can add up to three files or online links in this section.

            What can and cannot be included:

            \u2022 You can include links to promotional videos, websites, other media, or documents you feel are relevant and help illustrate your application.
            \u2022 We will not consider business plans, annual accounts or company policy documents.

            Please note:

            \u2022 Essential information must be included within the form itself. Supplementary materials should only provide supporting content and should not contain key details that are required in your answers.
            \u2022 For assessors to review the supporting material, you must reference them by their names in your answers. Please do so to ensure they are reviewed.
            \u2022 Please do not combine documents and do not link to folders. Assessors have limited time to evaluate your application, so any additional documents should be kept short and relevant.

            You can submit up to 3 files in most formats if they are less than 5 megabytes each.
          )
          hint "What are the allowed file formats?", %(
            <p>
              You can upload any of the following file formats: chm, csv, diff, doc, docx, dot, dxf, eps, gif, gml, ics, jpg, kml, odp, ods, odt, pdf, png, ppt, pptx, ps, rdf, rtf, sch, txt, wsdl, xls, xlsm, xlsx, xlt, xml, xsd, xslt, zip.
            </p>
          )
          max_attachments 3
          links
          description
        end

        confirm :entry_confirmation, "Confirmation of entry." do
          ref "F 2"
          required
          text -> do
            %(
              By submitting this entry for consideration for The King's Awards for Enterprise #{AwardYear.current.year}, I certify that all the given particulars and those in any accompanying statements are correct to the best of my knowledge and belief and that no material information has been withheld. I undertake to notify The King's Awards Office of any changes to the information I have provided in this entry form.
            )
          end
        end

        confirm :agree_being_contacted_about_issues_not_related_to_application, "Confirmation of contact." do
          ref "F 3"
          text %(
            I am happy to be contacted about The King's Awards for Enterprise issues not related to my application (for example, acting as a case study, newsletters, and other information).
          )
        end

        confirm :agree_being_contacted_by_department_of_business, "" do
          sub_ref "F 3.1"
          show_ref_always true
          text %(
            I am happy to be contacted by the Department for Business and Trade.
          )
        end

        submit "Submit application" do
          notice %(
            <p>
              If you have answered all the questions, you can submit your application now. You will be able to edit it any time before [SUBMISSION_ENDS_TIME].
            </p>
            <p>
              If you are not ready to submit yet, you can save your application and come back later.
            </p>
          )
        end
      end
    end
  end
end
