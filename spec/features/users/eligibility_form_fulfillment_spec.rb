require "rails_helper"
require "support/shared_web_helpers/form_helpers"

Warden.test_mode!

describe "Eligibility forms" do
  let!(:user) { create(:user, :completed_profile) }
  let!(:award_year) { AwardYear.current }
  let!(:collaborator) { create(:user, :completed_profile, role: "regular", account: user.account) }

  before do
    create(:settings, :submission_deadlines)
    login_as(user, scope: :user)
  end

  context "trade" do
    it "process the eligibility form", js: true do
      visit dashboard_path
      new_application("International Trade Award")
      click_button("Start eligibility questionnaire")
      click_link("Continue to eligibility questions")

      answer_basic_eligibility_questions

      # Trade eligibility questions
      form_choice([
        "Yes", # Has your business shown significant growth in overseas sales over the last 3 years?
        "Yes", # Do your overseas sales account for at least 5% of your total sales or at least £100,000 per year?
        "No",  # Have there been any significant dips in your overseas sales?
      ])

      expect(page).to have_content("You are eligible to begin your application")
      first(".previous-answers").click_link("Continue")
      expect(page).to have_content("You are eligible to begin your application for an International Trade Award.")
    end
  end

  context "innovation" do
    it "process the eligibility form" do
      visit dashboard_path
      new_application("Innovation Award")
      fill_in("award-reference", with: "innovation nick")
      click_button("Save and start eligibility questionnaire")
      click_link("Continue to eligibility questions")

      answer_basic_eligibility_questions

      # Innovation eligibility questions
      form_choice([
        "Yes", # Does your organization own, control, or have the rights to use the innovation being entered for this award?
        "Yes",  # Has your innovation achieved quantifiable commercial benefits for your business?
      ])

      fill_in("How many innovative products, services, business models or processes would you like to enter for the award?", with: 2)
      click_button "Continue"

      form_choice([
        "Yes", # Is your innovation currently available in the market?
        "Yes", # Has your innovation been on the market for at least two years?
        "Yes",  # Can you demonstrate that your innovation has benefited your business and wider society?
      ])

      expect(page).to have_content("You are eligible to begin your application")
      first(".previous-answers").click_link("Continue")
      expect(page).to have_content("You are eligible to begin your application for an Innovation Award.")
    end
  end

  context "development" do
    it "process the eligibility form" do
      visit dashboard_path
      new_application("Sustainable Development Award")
      click_button "Start eligibility questionnaire"
      click_link("Continue to eligibility questions")

      answer_basic_eligibility_questions

      # Development eligibility questions
      form_choice([
        "Yes", # Does your organization own, control, or have the rights to use the sustainable development initiative being entered?
        "Yes",  # Can you demonstrate that your sustainable development initiative has benefited your business and wider society?
      ])

      expect(page).to have_content("You are eligible to begin your application")
      first(".previous-answers").click_link("Continue")
      expect(page).to have_content("You are eligible to begin your application for a Sustainable Development Award.")
    end
  end

  context "mobility" do
    it "process the eligibility form" do
      visit dashboard_path
      new_application("Promoting Opportunity Award (through social mobility)")
      fill_in "award-reference", with: "mobility test"
      click_button "Save and start eligibility questionnaire"
      click_link "Continue to eligibility questions"

      answer_basic_eligibility_questions

      # Mobility eligibility questions
      form_choice([
        "Yes",                # Can you provide financial performance figures for the last three years?
        "A. We have an initiative that supports social mobility as a discretionary activity (social mobility is not our core activity).", # How does social mobility relate to your organization's activities?
        "Yes",               # Have you been actively promoting opportunity through social mobility to help disadvantaged groups?
        "Yes",               # Are your target beneficiary group members based in the UK?
        "Yes",               # Do your activities focus on improving socio-economic/educational opportunities?
        "Yes",               # Have you been running these initiatives for at least two years?
        "Yes",                # Can you demonstrate evidence of positive impact on beneficiaries?
      ])

      expect(page).to have_content("You are eligible to begin your application")
      first(".previous-answers").click_link("Continue")
      expect(page).to have_content("You are eligible to begin your application for a Promoting Opportunity (through social mobility) Award")
    end
  end

  def answer_basic_eligibility_questions
    form_choice([
      "Yes",     # Is your business based in the UK (including the Channel Islands and the Isle of Man)?
      "Yes",     # Does your organization file Company Tax Returns with HMRC?
      "Business (for example, companies, partnerships, social enterprises)", # What kind of organization are you?
      "Yes",     # Does your organization have at least two full-time UK employees (or full-time equivalent)?
      /Product/, # What is your main business activity?
      "Yes",     # Is your organization a self-contained enterprise which markets its own products or services?
      "No",      # Are you a current holder of a Queen's Award for Enterprise?
      "Yes",      # Do you agree to promote and demonstrate ethical business practices in line with ESG principles?
    ])
  end
end
