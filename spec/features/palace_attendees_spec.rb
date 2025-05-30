require "rails_helper"

describe "Palace Attendees", '
As a head of organization
I want to be able to setup Buckingham Palace attendees details
So that I provide a full list of attendees for Buckingham Palace reception
' do
  let(:user) do
    create :user, :completed_profile, role: "account_admin"
  end

  let!(:form_answer) do
    create :form_answer, :innovation, :awarded, user: user
  end

  let!(:award_year) do
    create(:award_year)
  end

  let!(:year_settings) do
    settings = award_year.settings

    invite = settings.deadlines.where(kind: "buckingham_palace_attendees_invite").first
    invite.update_column(:trigger_at, DateTime.new(Date.current.year, 7, 14, 18, 00))

    attendees_info_due = settings.deadlines.where(
      kind: "buckingham_palace_reception_attendee_information_due_by",
    ).first
    attendees_info_due.update_column(:trigger_at,
      DateTime.new(Date.current.year, 5, 6, 00, 00),
    )

    settings.reload
  end

  let!(:palace_invite) do
    create :palace_invite, form_answer: form_answer, email: user.email
  end

  let!(:settings) do
    create(:settings, :expired_submission_deadlines)
  end

  describe "Access" do
    describe "Should be at the winners stage" do
      it "should reject applicant with access denied message" do
        visit dashboard_path
        expect(page).to_not have_link("Palace Attendees")

        visit edit_palace_invite_path(id: palace_invite.token)
        expect(page).to have_no_content("Windsor Castle Attendee")

        settings.email_notifications.create!(
          kind: "winners_notification",
          trigger_at: DateTime.now - 1.year,
        )

        visit edit_palace_invite_path(id: palace_invite.token)
        expect(page).to have_content("Royal Reception at Windsor Castle")
      end
    end

    describe "Invite should be not submitted yet" do
      before do
        settings.email_notifications.create!(
          kind: "winners_notification",
          trigger_at: DateTime.now - 1.year,
        )
        palace_invite.submitted = true
        palace_invite.save!
      end

      it "should reject applicant with access denied message" do
        visit edit_palace_invite_path(id: palace_invite.token)
        expect_to_see "Royal Reception at Windsor Castle"
        expect(page).to have_no_content("Save")
      end
    end
  end

  describe "Save & Submit" do
    before do
      settings.email_notifications.create!(
        kind: "winners_notification",
        trigger_at: DateTime.now - 1.year,
      )

      visit edit_palace_invite_path(id: palace_invite.token)
    end

    let(:title) { "Mr." }
    let(:my_first_name) { "MyFirstName" }
    let(:attendee) do
      palace_invite.reload.palace_attendees.first
    end

    describe "Save" do
      it "should allow to Save palace attendees as a draft without validation" do
        select "Mr.", from: "Title"
        fill_in "First name", with: my_first_name

        expect {
          click_on "Confirm and submit attendee's details"
        }.not_to change {
          palace_invite.reload.submitted
        }

        expect_to_see "This field cannot be blank"
        expect_to_see_no "Windsor Castle Attendee details have been successfully submitted."

        click_on "Save"

        expect(attendee.title).to be_eql(title)
        expect(attendee.first_name).to be_eql(my_first_name)

        expect_to_see "Windsor Castle Attendee details have been successfully updated."
      end
    end

    describe "Submit" do
      it "should allow to Submit valid palace attendees" do
        select "Mr.", from: "Title"
        fill_in "First name", with: my_first_name
        fill_in "Surname", with: "Test"
        fill_in "Job title/position", with: "Test"
        fill_in "Sector", with: "Test"
        fill_in "Decorations/post-nominals", with: "Test"
        royal_family_connections = find('input[name="palace_invite[palace_attendees_attributes][0][has_royal_family_connections]"]', match: :first)
        royal_family_connections.set(true)
        fill_in "If you have any association with Commonwealth countries, please provide details. (If not, leave blank.)", with: "I am head of state for most of them"
        fill_in "If you are a leader or volunteer in a Culture, Community, or Climate initiative, please provide details. (If not, leave blank.)", with: "Too much to write here. I'll send a letter"
        fill_in "Please provide details of your or your organisation's associations with the Royal Family.", with: "I am the son of the Queen"
        fill_in "Address line 1", with: "Test"
        fill_in "Address line 2", with: "Test"
        fill_in "City or town", with: "Test"
        select "Avon", from: "County"
        fill_in "Postcode", with: "Test"
        fill_in "Telephone number", with: "Test"
        disabled_access = find('input[name="palace_invite[palace_attendees_attributes][0][disabled_access]"]', match: :first)
        disabled_access.set(true)

        expect {
          click_on "Confirm and submit attendee's details"
        }.to change {
          palace_invite.reload.submitted
        }

        expect(attendee.title).to be_eql(title)
        expect(attendee.first_name).to be_eql(my_first_name)

        expect_to_see "Windsor Castle Attendee details have been successfully submitted."
      end
    end
  end
end
