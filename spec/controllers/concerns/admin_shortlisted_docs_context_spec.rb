require "rails_helper"

RSpec.shared_examples AdminShortlistedDocsContext do |relationship_name|
  before do
    sign_in user
  end

  describe "GET show" do
    it "sends the file data back in the response" do
      expect(controller).to receive(:send_data).with(resource.attachment.read, filename: resource.attachment.file.filename, disposition: "attachment")
      get :show, params: { form_answer_id: form_answer.id, id: resource.id }, format: :png
    end
  end

  describe "POST create" do
    context "when the resource is saved successfully" do
      it "create the resource from the expected class" do
        resource.class.destroy_all

        expect do
          post :create, params: { form_answer_id: form_answer.id,
                                  "#{relationship_name}": { attachment: Rack::Test::UploadedFile.new(
                                    Rails.root.join("spec/fixtures/cat.jpg"),
                                  ) } }
        end.to change { resource.class.count }.from(0).to(1)

        expect(response).to redirect_to [user.class.name.downcase.to_sym, form_answer]
      end

      context "and the format is js" do
        it "renders the figures and vat returns partial" do
          post :create, params: { form_answer_id: form_answer.id,
                                  "#{relationship_name}": { attachment: Rack::Test::UploadedFile.new(
                                    Rails.root.join("spec/fixtures/cat.jpg"),
                                  ) } }, format: :js

          expect(response).to render_template("admin/figures_and_vat_returns/_file")
        end
      end
    end

    context "when the resource is not saved successfully" do
      it "does not create the resource and redirects back to the form answer" do
        expect do
          post :create, params: { form_answer_id: form_answer.id, "#{relationship_name}": { attachment: nil } }
        end.not_to change { resource.class.count }

        expect(response).to redirect_to [user.class.name.downcase.to_sym, form_answer]
      end

      context "and the format is js" do
        it "renders the figures and vat returns form partial" do
          post :create, params: { form_answer_id: form_answer.id, "#{relationship_name}": { attachment: nil } }, format: :js

          expect(response).to render_template("admin/figures_and_vat_returns/_form")
        end
      end
    end
  end

  describe "DELETE destroy" do
    context "when the resource is deleted successfully" do
      it "logs the event" do
        expect(controller).to receive(:log_event)
        delete :destroy, params: { form_answer_id: form_answer.id, id: resource.id }
      end

      it "redirects to the form answer" do
        delete :destroy, params: { form_answer_id: form_answer.id, id: resource.id }
        expect(response).to redirect_to [user.class.name.downcase.to_sym, form_answer]
      end

      context "and the format is js" do
        it "renders head :ok" do
          delete :destroy, params: { form_answer_id: form_answer.id, id: resource.id }, format: :js

          expect(response.status).to eq 200
          expect(response.body).to eq ""
        end
      end
    end
  end
end
