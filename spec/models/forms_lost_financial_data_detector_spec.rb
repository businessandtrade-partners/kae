require "rails_helper"

RSpec.describe FormsLostFinancialDataDetector do
  describe "#new" do
    context "when there are form answers that fit the criteria" do
      before do
        5.times do
          create(:form_answer).update_columns(updated_at: Date.parse("2015/09/29"))
        end
      end

      it "assigns them to the forms attribute" do
        expect(described_class.new.forms.size).to eq 5
      end
    end

    context "when no form answers fit the criteria" do
      before do
        5.times do
          create(:form_answer, :trade, document: {
            "employees_1of2" => "value",
            "employees_1of3" => "value",
            "employees_1of4" => "value",
          }).update_columns(updated_at: Date.parse("2015/09/29"))
        end
      end

      it "does not assign them to the form attribute" do
        expect(described_class.new.forms.size).to eq 0
      end
    end
  end
end
