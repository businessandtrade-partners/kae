require "rails_helper"

describe "User sees the pre submission dashboard" do
  let(:user) { create(:user, :completed_profile) }

  before do
    Settings.current_award_year_switch_date.update(trigger_at: 10.days.ago)
    login_as user
  end

  describe "when visits the dashboard before any awards are opened" do
    it "should see message confirming that" do
      visit dashboard_path
      expect(page).to have_content("The new round of Awards to be announced next year opens for applications on 6th May.")
    end
  end

  describe "when visits the dashboard after some awards are opened" do
    it "should see message confirming that" do
      Settings.current.deadlines.innovation_submission_start.update(trigger_at: 1.day.ago)
      visit dashboard_path
      expect(page).to have_content("The Awards application period is now open and will close on 9th September.")
      expect(page).to have_link("New application", href: "/apply_innovation_award")
      expect(page).not_to have_link("New application", href: "/apply_international_trade_award")
      expect(page).not_to have_link("New application", href: "/apply_sustainable_development_award")
      expect(page).not_to have_link("New application", href: "/apply_social_mobility_award")
    end
  end

  describe "when visits the dashboard after all awards are opened" do
    it "should see message confirming that" do
      Settings.current.deadlines.innovation_submission_start.update(trigger_at: 1.day.ago)
      Settings.current.deadlines.mobility_submission_start.update(trigger_at: 1.day.ago)
      Settings.current.deadlines.development_submission_start.update(trigger_at: 1.day.ago)
      Settings.current.deadlines.trade_submission_start.update(trigger_at: 1.day.ago)

      visit dashboard_path

      expect(page).to have_no_content("The new round of Awards to be announced next year opens for applications on 6th May.")

      expect(page).to have_link("New application", href: "/apply_innovation_award")
      expect(page).to have_link("New application", href: "/apply_international_trade_award")
      expect(page).to have_link("New application", href: "/apply_sustainable_development_award")
      expect(page).to have_link("New application", href: "/apply_social_mobility_award")
    end
  end
end
