require "spec_helper"

describe Hasil2sController do
  describe "routing" do

    it "routes to #index" do
      get("/hasil2s").should route_to("hasil2s#index")
    end

    it "routes to #new" do
      get("/hasil2s/new").should route_to("hasil2s#new")
    end

    it "routes to #show" do
      get("/hasil2s/1").should route_to("hasil2s#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hasil2s/1/edit").should route_to("hasil2s#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hasil2s").should route_to("hasil2s#create")
    end

    it "routes to #update" do
      put("/hasil2s/1").should route_to("hasil2s#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hasil2s/1").should route_to("hasil2s#destroy", :id => "1")
    end

  end
end
