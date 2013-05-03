require "spec_helper"

describe AtendentesController do
  describe "routing" do

    it "routes to #index" do
      get("/atendentes").should route_to("atendentes#index")
    end

    it "routes to #new" do
      get("/atendentes/new").should route_to("atendentes#new")
    end

    it "routes to #show" do
      get("/atendentes/1").should route_to("atendentes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/atendentes/1/edit").should route_to("atendentes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/atendentes").should route_to("atendentes#create")
    end

    it "routes to #update" do
      put("/atendentes/1").should route_to("atendentes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/atendentes/1").should route_to("atendentes#destroy", :id => "1")
    end

  end
end
