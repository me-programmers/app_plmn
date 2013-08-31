require "spec_helper"

describe Pasien3sController do
  describe "routing" do

    it "routes to #index" do
      get("/pasien3s").should route_to("pasien3s#index")
    end

    it "routes to #new" do
      get("/pasien3s/new").should route_to("pasien3s#new")
    end

    it "routes to #show" do
      get("/pasien3s/1").should route_to("pasien3s#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pasien3s/1/edit").should route_to("pasien3s#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pasien3s").should route_to("pasien3s#create")
    end

    it "routes to #update" do
      put("/pasien3s/1").should route_to("pasien3s#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pasien3s/1").should route_to("pasien3s#destroy", :id => "1")
    end

  end
end
