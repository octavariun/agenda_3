require "spec_helper"

describe CargosController do
  describe "routing" do

    it "routes to #index" do
      get("/cargos").should route_to("cargos#index")
    end

    it "routes to #new" do
      get("/cargos/new").should route_to("cargos#new")
    end

    it "routes to #show" do
      get("/cargos/1").should route_to("cargos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/cargos/1/edit").should route_to("cargos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/cargos").should route_to("cargos#create")
    end

    it "routes to #update" do
      put("/cargos/1").should route_to("cargos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/cargos/1").should route_to("cargos#destroy", :id => "1")
    end

  end
end
