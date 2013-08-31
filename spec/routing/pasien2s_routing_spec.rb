require "spec_helper"

describe Pasien2sController do
  describe "routing" do

    it "routes to #index" do
      get("/pasien2s").should route_to("pasien2s#index")
    end

    it "routes to #new" do
      get("/pasien2s/new").should route_to("pasien2s#new")
    end

    it "routes to #show" do
      get("/pasien2s/1").should route_to("pasien2s#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pasien2s/1/edit").should route_to("pasien2s#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pasien2s").should route_to("pasien2s#create")
    end

    it "routes to #update" do
      put("/pasien2s/1").should route_to("pasien2s#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pasien2s/1").should route_to("pasien2s#destroy", :id => "1")
    end

  end
end
