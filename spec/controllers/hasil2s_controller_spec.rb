require 'spec_helper'

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

describe Hasil2sController do

  # This should return the minimal set of attributes required to create a valid
  # Hasil2. As you add validations to Hasil2, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "hsl_echantillon" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Hasil2sController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all hasil2s as @hasil2s" do
      hasil2 = Hasil2.create! valid_attributes
      get :index, {}, valid_session
      assigns(:hasil2s).should eq([hasil2])
    end
  end

  describe "GET show" do
    it "assigns the requested hasil2 as @hasil2" do
      hasil2 = Hasil2.create! valid_attributes
      get :show, {:id => hasil2.to_param}, valid_session
      assigns(:hasil2).should eq(hasil2)
    end
  end

  describe "GET new" do
    it "assigns a new hasil2 as @hasil2" do
      get :new, {}, valid_session
      assigns(:hasil2).should be_a_new(Hasil2)
    end
  end

  describe "GET edit" do
    it "assigns the requested hasil2 as @hasil2" do
      hasil2 = Hasil2.create! valid_attributes
      get :edit, {:id => hasil2.to_param}, valid_session
      assigns(:hasil2).should eq(hasil2)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Hasil2" do
        expect {
          post :create, {:hasil2 => valid_attributes}, valid_session
        }.to change(Hasil2, :count).by(1)
      end

      it "assigns a newly created hasil2 as @hasil2" do
        post :create, {:hasil2 => valid_attributes}, valid_session
        assigns(:hasil2).should be_a(Hasil2)
        assigns(:hasil2).should be_persisted
      end

      it "redirects to the created hasil2" do
        post :create, {:hasil2 => valid_attributes}, valid_session
        response.should redirect_to(Hasil2.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved hasil2 as @hasil2" do
        # Trigger the behavior that occurs when invalid params are submitted
        Hasil2.any_instance.stub(:save).and_return(false)
        post :create, {:hasil2 => { "hsl_echantillon" => "invalid value" }}, valid_session
        assigns(:hasil2).should be_a_new(Hasil2)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Hasil2.any_instance.stub(:save).and_return(false)
        post :create, {:hasil2 => { "hsl_echantillon" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested hasil2" do
        hasil2 = Hasil2.create! valid_attributes
        # Assuming there are no other hasil2s in the database, this
        # specifies that the Hasil2 created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Hasil2.any_instance.should_receive(:update_attributes).with({ "hsl_echantillon" => "1" })
        put :update, {:id => hasil2.to_param, :hasil2 => { "hsl_echantillon" => "1" }}, valid_session
      end

      it "assigns the requested hasil2 as @hasil2" do
        hasil2 = Hasil2.create! valid_attributes
        put :update, {:id => hasil2.to_param, :hasil2 => valid_attributes}, valid_session
        assigns(:hasil2).should eq(hasil2)
      end

      it "redirects to the hasil2" do
        hasil2 = Hasil2.create! valid_attributes
        put :update, {:id => hasil2.to_param, :hasil2 => valid_attributes}, valid_session
        response.should redirect_to(hasil2)
      end
    end

    describe "with invalid params" do
      it "assigns the hasil2 as @hasil2" do
        hasil2 = Hasil2.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Hasil2.any_instance.stub(:save).and_return(false)
        put :update, {:id => hasil2.to_param, :hasil2 => { "hsl_echantillon" => "invalid value" }}, valid_session
        assigns(:hasil2).should eq(hasil2)
      end

      it "re-renders the 'edit' template" do
        hasil2 = Hasil2.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Hasil2.any_instance.stub(:save).and_return(false)
        put :update, {:id => hasil2.to_param, :hasil2 => { "hsl_echantillon" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested hasil2" do
      hasil2 = Hasil2.create! valid_attributes
      expect {
        delete :destroy, {:id => hasil2.to_param}, valid_session
      }.to change(Hasil2, :count).by(-1)
    end

    it "redirects to the hasil2s list" do
      hasil2 = Hasil2.create! valid_attributes
      delete :destroy, {:id => hasil2.to_param}, valid_session
      response.should redirect_to(hasil2s_url)
    end
  end

end
