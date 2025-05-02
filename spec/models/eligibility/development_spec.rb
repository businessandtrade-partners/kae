require "rails_helper"

RSpec.describe Eligibility::Development, type: :model do
  let(:account) { FactoryBot.create(:account) }

  context "answers storage" do
    it "saves and reads answers" do
      eligibility = Eligibility::Development.new(account: account)
      eligibility.able_to_provide_actual_figures = "yes"

      expect { eligibility.save! }.to change {
        Eligibility::Development.count
      }.by(1)

      eligibility = Eligibility::Development.last

      expect(eligibility.account).to eq(account)
      expect(eligibility).to be_able_to_provide_actual_figures
    end
  end

  describe "#eligible?" do
    let(:eligibility) { Eligibility::Development.new(account: account) }

    it "is not eligible by default" do
      expect(eligibility).not_to be_eligible
    end

    it "is eligible when all questions are answered correctly" do
      eligibility.able_to_provide_actual_figures = "yes"
      eligibility.adheres_to_sustainable_principles = "yes"
      expect(eligibility).to be_eligible
    end

    it "is not eligible when not all answers are correct" do
      eligibility.able_to_provide_actual_figures = "no"

      expect(eligibility).not_to be_eligible
    end
  end

  describe ".award_name" do
    let(:eligibility) { Eligibility::Development.new(account: account) }

    it "should return award_name" do
      expect(eligibility.class.award_name).to eq "Sustainable Development Award"
    end
  end
end
