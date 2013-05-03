require "spec_helper"

describe PessoasController do
  describe "routing" do

    it "routes to #index" do
      get("/pessoas").should route_to("pessoas#index")
    end

    it "routes to #new" do
      get("/pessoas/new").should route_to("pessoas#new")
    end

    it "routes to #show" do
      get("/pessoas/1").should route_to("pessoas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pessoas/1/edit").should route_to("pessoas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pessoas").should route_to("pessoas#create")
    end

    it "routes to #update" do
      put("/pessoas/1").should route_to("pessoas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pessoas/1").should route_to("pessoas#destroy", :id => "1")
    end

  end
end
