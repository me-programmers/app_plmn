require "spec_helper"

describe Hasil3sController do
  describe "routing" do

    it "routes to #index" do
      get("/hasil3s").should route_to("hasil3s#index")
    end

    it "routes to #new" do
      get("/hasil3s/new").should route_to("hasil3s#new")
    end

    it "routes to #show" do
      get("/hasil3s/1").should route_to("hasil3s#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hasil3s/1/edit").should route_to("hasil3s#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hasil3s").should route_to("hasil3s#create")
    end

    it "routes to #update" do
      put("/hasil3s/1").should route_to("hasil3s#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hasil3s/1").should route_to("hasil3s#destroy", :id => "1")
    end

  end
end
