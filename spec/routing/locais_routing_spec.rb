require "spec_helper"

describe LocaisController do
  describe "routing" do

    it "routes to #index" do
      get("/locais").should route_to("locais#index")
    end

    it "routes to #new" do
      get("/locais/new").should route_to("locais#new")
    end

    it "routes to #show" do
      get("/locais/1").should route_to("locais#show", :id => "1")
    end

    it "routes to #edit" do
      get("/locais/1/edit").should route_to("locais#edit", :id => "1")
    end

    it "routes to #create" do
      post("/locais").should route_to("locais#create")
    end

    it "routes to #update" do
      put("/locais/1").should route_to("locais#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/locais/1").should route_to("locais#destroy", :id => "1")
    end

  end
end
