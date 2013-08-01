require "spec_helper"

describe HasilsController do
  describe "routing" do

    it "routes to #index" do
      get("/hasils").should route_to("hasils#index")
    end

    it "routes to #new" do
      get("/hasils/new").should route_to("hasils#new")
    end

    it "routes to #show" do
      get("/hasils/1").should route_to("hasils#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hasils/1/edit").should route_to("hasils#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hasils").should route_to("hasils#create")
    end

    it "routes to #update" do
      put("/hasils/1").should route_to("hasils#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hasils/1").should route_to("hasils#destroy", :id => "1")
    end

  end
end
