require "rails_helper"

RSpec.describe Form::PositionsController do
  let!(:user) { create(:user) }
  let!(:form_answer) { create :form_answer, user: user }
  let(:valid_params) do
    { form_answer_id: form_answer.id,
      position: {
        name: "Name of position",
        details: "details of position",
        ongoing: "true",
        start_month: "Jan",
        start_year: "2018",
        end_month: "Dec",
        end_year: "2022",
      },
      }
  end

  before do
    sign_in user
  end

  describe "GET index" do
    it "renders the new template" do
      get :index, params: { form_answer_id: form_answer.id }
      expect(response).to render_template("index")
    end

    it "exposes some key variables" do
      get :index, params: { form_answer_id: form_answer.id }
      expect(controller.input_name).to eq "position_details"
      expect(controller.section_folder_name).to eq "positions"
      expect(controller.item_name).to eq "Role"
      expect(controller.item.class).to eq Position
      expect(controller.step).to eq nil # only applies to specific year/award type
    end
  end

  describe "GET new" do
    it "renders the new template" do
      get :new, params: { form_answer_id: form_answer.id }
      expect(response).to render_template("new")
    end
  end

  describe "POST create" do
    context "when the params are valid and the resource saves successfully" do
      it "should create a resource" do
        post :create, params: valid_params
        expect(response).to redirect_to form_form_answer_positions_url(form_answer)

        expect(form_answer.reload.document["position_details"]).to include({ "name" => "Name of position", "details" => "details of position", "ongoing" => "true", "start_month" => "Jan", "start_year" => "2018", "end_month" => "Dec", "end_year" => "2022" })
      end
    end

    context "when the resource fails to save" do
      it "renders :new" do
        post :create, params: { form_answer_id: form_answer.id,
                                position: {
                                  name: nil,
                                  details: nil,
                                  ongoing: "true",
                                  start_month: "Jan",
                                  start_year: "2018",
                                  end_month: "Dec",
                                  end_year: "2022",
                                },
        }
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    before do
      form_answer.update(document: { "position_details" => [valid_params[:position]] })
    end

    it "removes the data from the form answer document" do
      delete :destroy, params: valid_params
      expect(form_answer.reload.document["position_details"]).to eq([])
      expect(response).to redirect_to form_form_answer_positions_url(form_answer)
    end
  end

  describe "GET edit" do
    it "assigns the item_params to the object and renders the edit template" do
      get :edit, params: valid_params
      expect(controller.item.name).to eq valid_params[:position][:name]
      expect(controller.item.details).to eq valid_params[:position][:details]

      expect(response).to render_template("edit")
    end
  end

  describe "PATCH update" do
    context "when the params are valid and the resource saves successfully" do
      it "should update the form answer document" do
        patch :update, params: valid_params
        expect(response).to redirect_to form_form_answer_positions_url(form_answer)

        expect(form_answer.reload.document["position_details"]).to include({ "name" => "Name of position", "details" => "details of position", "ongoing" => "true", "start_month" => "Jan", "start_year" => "2018", "end_month" => "Dec", "end_year" => "2022" })
      end
    end

    context "when the resource fails to save" do
      it "renders :new" do
        patch :update, params: { form_answer_id: form_answer.id,
                                 position: {
                                   name: nil,
                                   details: nil,
                                   ongoing: "true",
                                   start_month: "Jan",
                                   start_year: "2018",
                                   end_month: "Dec",
                                   end_year: "2022",
                                 },
        }
        expect(response).to render_template("edit")
      end
    end
  end
end
