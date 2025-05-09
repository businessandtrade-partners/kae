require "award_years/v2026/sustainable_development/sustainable_development_step1"
require "award_years/v2026/sustainable_development/sustainable_development_step2"
require "award_years/v2026/sustainable_development/sustainable_development_step3"
require "award_years/v2026/sustainable_development/sustainable_development_step4"
require "award_years/v2026/sustainable_development/sustainable_development_step5"

class AwardYears::V2026::QaeForms
  class << self
    def development
      @development ||= QaeFormBuilder.build "Sustainable Development Award Application" do
        step "Consent & Due Diligence",
          "Consent & Due Diligence",
          &AwardYears::V2026::QaeForms.development_step1

        step "Company information",
          "Company information",
          &AwardYears::V2026::QaeForms.development_step2

        step "Your Sustainability",
          "Your Sustainability",
          &AwardYears::V2026::QaeForms.development_step3

        step "Commercial Performance",
          "Commercial Performance",
          &AwardYears::V2026::QaeForms.development_step4

        step "Supplementary Materials & Confirmation",
          "Supplementary Materials & Confirmation",
          { id: :add_website_address_documents_step },
          &AwardYears::V2026::QaeForms.development_step5
      end
    end
  end
end
