require "spec_helper"

describe PasiensController do
  describe "routing" do

    it "routes to #index" do
      get("/pasiens").should route_to("pasiens#index")
    end

    it "routes to #new" do
      get("/pasiens/new").should route_to("pasiens#new")
    end

    it "routes to #show" do
      get("/pasiens/1").should route_to("pasiens#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pasiens/1/edit").should route_to("pasiens#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pasiens").should route_to("pasiens#create")
    end

    it "routes to #update" do
      put("/pasiens/1").should route_to("pasiens#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pasiens/1").should route_to("pasiens#destroy", :id => "1")
    end

  end
end
