class AccountMailers::BuckinghamPalaceInviteMailer < AccountMailers::BaseMailer
  before_action :set_end_of_embargo_deadline
  before_action :set_media_deadline
  before_action :set_press_summary_deadline
  before_action :set_reception_deadlines

  def invite(form_answer_id, notify_to_press_contact = false)
    form_answer = FormAnswer.find(form_answer_id).decorate
    invite = form_answer.palace_invite

    @urn = form_answer.urn
    @token = invite.token
    @award_year = form_answer.award_year.year
    @award_category_title = form_answer.award_type_full_name

    if notify_to_press_contact.present?
      @email = form_answer.press_contact_details_email
      @name = form_answer.press_contact_details_full_name
    else
      @email = form_answer.head_of_business_email
      @name = form_answer.head_of_business_full_name
    end

    subject = "Important information about your King's Award application"
    send_mail_if_not_bounces ENV["GOV_UK_NOTIFY_API_TEMPLATE_ID"], to: @email, subject: subject_with_env_prefix(subject)
  end
end
