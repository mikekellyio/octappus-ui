require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe Admin::StepsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Step. As you add validations to Admin::Step, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {title: "A title", content: "Some content"}
  }

  let(:invalid_attributes) {
    {bad: "params"}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Admin::StepsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all admin_steps as @admin_steps" do
      step = Step.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:steps)).to eq([step])
    end
  end

  describe "GET #show" do
    it "assigns the requested admin_step as @admin_step" do
      step = Step.create! valid_attributes
      get :show, {:id => step.to_param}, valid_session
      expect(assigns(:step)).to eq(step)
    end
  end

  describe "GET #new" do
    it "assigns a new admin_step as @admin_step" do
      get :new, {}, valid_session
      expect(assigns(:step)).to be_a_new(Step)
    end
  end

  describe "GET #edit" do
    it "assigns the requested admin_step as @admin_step" do
      step = Step.create! valid_attributes
      get :edit, {:id => step.to_param}, valid_session
      expect(assigns(:step)).to eq(step)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Step" do
        expect {
          post :create, {:step => valid_attributes}, valid_session
        }.to change(Step, :count).by(1)
      end

      it "assigns a newly created admin_step as @step" do
        post :create, {:step => valid_attributes}, valid_session
        expect(assigns(:step)).to be_a(Step)
        expect(assigns(:step)).to be_persisted
      end

      it "redirects to the created step" do
        post :create, {:step => valid_attributes}, valid_session
        expect(response).to redirect_to(admin_step_url(Step.last))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved step as @step" do
        post :create, {:step => invalid_attributes}, valid_session
        expect(assigns(:step)).to be_a_new(Step)
      end

      it "re-renders the 'new' template" do
        post :create, {:step => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {title: "New title", content: "New content"}
      }

      it "updates the requested admin_step" do
        step = Step.create! valid_attributes
        put :update, {:id => step.to_param, :step => new_attributes}, valid_session
        step.reload
        expect(step.title).to eq("New title")
        expect(step.content).to eq("New content")
      end

      it "assigns the requested step as @step" do
        step = Step.create! valid_attributes
        put :update, {:id => step.to_param, :step => valid_attributes}, valid_session
        expect(assigns(:step)).to eq(step)
      end

      it "redirects to the admin_step" do
        step = Step.create! valid_attributes
        put :update, {:id => step.to_param, :step => valid_attributes}, valid_session
        expect(response).to redirect_to(admin_step_url(step))
      end
    end

    context "with invalid params" do
      it "assigns the step as @step" do
        step = Step.create! valid_attributes
        put :update, {:id => step.to_param, :step => invalid_attributes}, valid_session
        expect(assigns(:step)).to eq(step)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested step" do
      step = Step.create! valid_attributes
      expect {
        delete :destroy, {:id => step.to_param}, valid_session
      }.to change(Step, :count).by(-1)
    end

    it "redirects to the steps list" do
      step = Step.create! valid_attributes
      delete :destroy, {:id => step.to_param}, valid_session
      expect(response).to redirect_to(admin_steps_url)
    end
  end

end
