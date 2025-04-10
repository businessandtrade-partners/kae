require "rails_helper"

describe AuditCertificateContext, type: :controller do
  described_class.tap do |mod|
    controller(ActionController::Base) do
      include mod
      include Pundit
    end
  end

  let!(:admin) { create(:admin, superadmin: true) }
  before do
    sign_in admin
    routes.draw {
      get "show" => "anonymous#show"
    }
    double = instance_double("Aws::S3::Presigner")
    allow(Aws::S3::Presigner).to receive(:new).and_return(double)
    allow(double).to receive(:presigned_request).and_return ["https://bucket.s3.eu-west-2.amazonaws.com/presigned-url"]
  end

  describe "GET show" do
    it "should redirect to attachment_url" do
      allow(controller).to receive(:authorize).and_return(true)
      form_answer = build(:form_answer)
      audit_certificate = build(:audit_certificate)

      allow(FormAnswer).to receive(:find) { form_answer }
      allow_any_instance_of(FormAnswer).to receive(:audit_certificate).and_return(audit_certificate)
      get :show, params: { form_answer_id: form_answer.id }
      expect(response).to redirect_to "https://bucket.s3.eu-west-2.amazonaws.com/presigned-url"
    end
  end
end
