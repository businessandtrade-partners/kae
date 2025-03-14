require "rails_helper"
require Rails.root.join("spec/controllers/concerns/admin_shortlisted_docs_context_spec.rb")

RSpec.describe Assessor::CommercialFiguresFilesController do
  let!(:user) { create(:assessor) }
  let!(:form_answer) { create(:form_answer) }
  let(:resource) { create(:commercial_figures_file, form_answer:) }

  before do
    sign_in user
    allow_any_instance_of(Assessor).to receive(:lead?) { true }
  end

  it_behaves_like AdminShortlistedDocsContext, :commercial_figures_file

  describe "#relationship_name" do
    it "returns the expected symbol for the class" do
      expect(controller.send(:relationship_name)).to eq :commercial_figures_file
    end
  end

  describe "#resource_class" do
    it "returns the expected model class" do
      expect(controller.send(:resource_class)).to eq CommercialFiguresFile
    end
  end
end
