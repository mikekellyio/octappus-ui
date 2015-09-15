require "rails_helper"

RSpec.describe Admin::ChildrenController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/children").to route_to("admin/children#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/children/new").to route_to("admin/children#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/children/1").to route_to("admin/children#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/children/1/edit").to route_to("admin/children#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/children").to route_to("admin/children#create")
    end

    it "routes to #update" do
      expect(:put => "/admin/children/1").to route_to("admin/children#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/children/1").to route_to("admin/children#destroy", :id => "1")
    end

  end
end
