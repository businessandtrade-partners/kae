require "rails_helper"

RSpec.describe Form::OrganisationalChartsController do
  let!(:user) { create(:user) }

  let!(:form_answer) { create :form_answer, user: user }

  before do
    sign_in user
  end

  describe "GET new" do
    it "renders the new template" do
      get :new, params: { form_answer_id: form_answer.id }
      expect(response).to render_template("new")
    end

    context "when there are form answer attachments" do
      let(:org_chart) { create(:form_answer_attachment, form_answer:) }

      it "exposes form_answer_attachment" do
        get :new, params: { form_answer_id: form_answer.id }
        expect(controller.form_answer_attachment).not_to be_nil
      end
    end
  end

  describe "POST create" do
    context "when the params are valid and the resource saves successfully" do
      it "should create a resource" do
        post :create, params: { form_answer_id: form_answer.id,
                                form_answer_attachment: { file: Rack::Test::UploadedFile.new(
                                  Rails.root.join("spec/fixtures/cat.jpg"),
                                ),
                                                          form_answer_id: form_answer.id } }
        expect(response).to redirect_to edit_form_url(form_answer, step: "company-information", anchor: "header_org_chart")

        expect(user.form_answer_attachments.count).to eq 1
        expect(form_answer.reload.document["org_chart"]).to include({ "0" => { "file" => user.form_answer_attachments.first.id.to_s } })
      end
    end

    context "when the resource fails to save" do
      it "renders :new" do
        post :create, params: { form_answer_id: form_answer.id, form_answer_attachment: { file: nil, form_answer_id: form_answer.id } }
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET confirm_deletion" do
    let(:org_chart) { create(:form_answer_attachment, form_answer:) }

    it "renders the confirm_deletion template" do
      get :confirm_deletion, params: { form_answer_id: form_answer.id, organisational_chart_id: org_chart.id }
      expect(response).to render_template("confirm_deletion")
    end
  end

  describe "DELETE destroy" do
    let(:org_chart) { create(:form_answer_attachment, form_answer:) }

    it "destroys the resource" do
      delete :destroy, params: { form_answer_id: form_answer.id, id: org_chart.id }
      expect(form_answer.reload.document["org_chart"]).to eq({})
    end

    context "when the request is js or xhr" do
      it "renders head :ok" do
        delete :destroy, params: { form_answer_id: form_answer.id, id: org_chart.id }, xhr: true
        expect(response.status).to eq 200
        expect(response.body).to eq ""
      end
    end

    context "when the request is html" do
      it "renders the edit form" do
        delete :destroy, params: { form_answer_id: form_answer.id, id: org_chart.id }
        expect(response).to redirect_to edit_form_url(form_answer, step: "company-information", anchor: "header_org_chart")
      end
    end
  end
end
