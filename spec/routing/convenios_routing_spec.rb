require "spec_helper"

describe ConveniosController do
  describe "routing" do

    it "routes to #index" do
      get("/convenios").should route_to("convenios#index")
    end

    it "routes to #new" do
      get("/convenios/new").should route_to("convenios#new")
    end

    it "routes to #show" do
      get("/convenios/1").should route_to("convenios#show", :id => "1")
    end

    it "routes to #edit" do
      get("/convenios/1/edit").should route_to("convenios#edit", :id => "1")
    end

    it "routes to #create" do
      post("/convenios").should route_to("convenios#create")
    end

    it "routes to #update" do
      put("/convenios/1").should route_to("convenios#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/convenios/1").should route_to("convenios#destroy", :id => "1")
    end

  end
end
