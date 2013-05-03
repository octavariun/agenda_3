require "spec_helper"

describe ConsultasController do
  describe "routing" do

    it "routes to #index" do
      get("/consultas").should route_to("consultas#index")
    end

    it "routes to #new" do
      get("/consultas/new").should route_to("consultas#new")
    end

    it "routes to #show" do
      get("/consultas/1").should route_to("consultas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/consultas/1/edit").should route_to("consultas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/consultas").should route_to("consultas#create")
    end

    it "routes to #update" do
      put("/consultas/1").should route_to("consultas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/consultas/1").should route_to("consultas#destroy", :id => "1")
    end

  end
end
