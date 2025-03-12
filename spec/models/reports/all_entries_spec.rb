require "rails_helper"

describe Reports::AllEntries do
  let(:year) { create(:award_year) }
  let(:report) { described_class.new(year) }

  describe "#stream" do
    let(:result) { report.stream.to_a }

    context "with a form_answer that has a document with escaped characters" do
      let(:form_answer) { create(:form_answer, :innovation, :recommended, award_year: year) }
      let(:escaped_character) { "&amp;" }

      before do
        form_answer.document["innovation_desc_short"] = "<p>AI powered platform that identifies (and completes) optimisation opportunities on business websites quickly #{escaped_character} easily.</p>\r\n"
        form_answer.save!
      end

      it "does escape the characters" do
        expect(result.length).to eq(2)
        expect(result.second).to include("AI powered platform that identifies (and completes) optimisation opportunities on business websites quickly & easily.")
        expect(result.second).not_to include(escaped_character)
      end
    end
  end
end
