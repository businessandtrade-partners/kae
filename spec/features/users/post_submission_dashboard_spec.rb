require "rails_helper"

describe "User sees the post submission dashboard" do
  let(:user) { create(:user, :completed_profile) }
  let!(:settings) { create(:settings, :submission_deadlines, award_year_id: AwardYear.current.id) }
  let!(:form_answer) { create(:form_answer, :with_audit_certificate, user: user) }

  before do
    form_answer.state_machine.submit(user)
    login_as user
  end

  describe "visits the post submission dashboard", js: true do
    it "sees applications properly" do
      visit dashboard_path
      expect(page).to have_content "Edit application"
      expect(page).to have_css("h2", text: "Current Applications")
      expect(page).to have_content("The Awards application period is now open")

      settings.destroy
      settings = create(:settings, :expired_submission_deadlines, award_year_id: AwardYear.current.id)
      form_answer.update_column(:state, "reserved")

      visit dashboard_path
      expect_to_have_blank_dashboard

      settings.email_notifications.create!(
        kind: "shortlisted_notifier",
        trigger_at: DateTime.now - 1.year,
      )
      visit dashboard_path
      expect(page).to have_content("The current application period is closed and the Awards are now undergoing final approval.")

      form_answer.update_column(:state, "awarded")
      visit dashboard_path
      expect_to_have_blank_dashboard

      settings.email_notifications.create!(
        kind: "winners_notification",
        trigger_at: DateTime.now - 1.year,
      )

      visit dashboard_path
      expect(page).to have_content("You should have received an email from us notifying you of the outcome of your application.")
      expect(page).to have_content("Congratulations on winning a King's Award for Enterprise")
      expect(page).to have_content("You will be notified when your press book notes are ready.")

      create :press_summary, form_answer: form_answer, approved: true, submitted: true

      visit dashboard_path
      expect(page).to have_link("Press Book Notes")

      form_answer.update_column(:state, "not_awarded")
      visit dashboard_path

      settings.email_notifications.create!(
        kind: "unsuccessful_notification",
        trigger_at: DateTime.now - 1.year,
      )

      visit dashboard_path
      expect(page).to have_content("You should have received an email from us notifying you of the outcome of your application.")
      expect(page).to have_content("Your following application was unsuccessful.")
    end
  end
end

def expect_to_have_blank_dashboard
  expect(page).to_not have_content("Shortlisted")
  expect(page).not_to have_css("h2", text: "Unsuccessful")
  expect(page).to_not have_content("Successful")
end
