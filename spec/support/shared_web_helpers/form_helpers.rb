def form_choice(labels)
  label_ids = Array(labels)

  label_ids.each do |label_id|
    # Wait for the current question to be visible
    expect(page).to have_css(".govuk-form-group.current-question.qae-form#current-question", wait: 10)

    # Wait for radio buttons to be present
    expect(page).to have_css(".govuk-radios__item", wait: 10)

    # Find the matching radio button with retries
    retries = 0
    begin
      l = all(".govuk-radios__item").detect do |label|
        if label_id.is_a?(String)
          label.text.strip == label_id.strip
        elsif label_id.is_a?(Regexp)
          label.text =~ label_id
        end
      end

      raise "Could not find radio button with label: #{label_id}" unless l

      # Click the radio input
      l.find("input[type='radio']", visible: false).click

      # Wait for the continue button and click it
      expect(page).to have_button("Continue", wait: 10)
      click_button "Continue"
    rescue Selenium::WebDriver::Error::StaleElementReferenceError
      retries += 1
      retry if retries < 3
      raise
    end
  end
end

def new_application(type)
  # Wait for the applications list to be present
  expect(page).to have_css(".applications-list")

  header = find(".applications-list .govuk-summary-list__row .govuk-summary-list__key .govuk-heading-s", text: type)
  within(header.find(:xpath, "../..")) do
    click_link("New application")
  end
end
