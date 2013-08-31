require "spec_helper"

describe Lab2sController do
  describe "routing" do

    it "routes to #index" do
      get("/lab2s").should route_to("lab2s#index")
    end

    it "routes to #new" do
      get("/lab2s/new").should route_to("lab2s#new")
    end

    it "routes to #show" do
      get("/lab2s/1").should route_to("lab2s#show", :id => "1")
    end

    it "routes to #edit" do
      get("/lab2s/1/edit").should route_to("lab2s#edit", :id => "1")
    end

    it "routes to #create" do
      post("/lab2s").should route_to("lab2s#create")
    end

    it "routes to #update" do
      put("/lab2s/1").should route_to("lab2s#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/lab2s/1").should route_to("lab2s#destroy", :id => "1")
    end

  end
end
