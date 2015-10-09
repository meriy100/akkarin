require "rails_helper"

RSpec.describe ShortCcsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/short_ccs").to route_to("short_ccs#index")
    end

    it "routes to #new" do
      expect(:get => "/short_ccs/new").to route_to("short_ccs#new")
    end

    it "routes to #show" do
      expect(:get => "/short_ccs/1").to route_to("short_ccs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/short_ccs/1/edit").to route_to("short_ccs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/short_ccs").to route_to("short_ccs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/short_ccs/1").to route_to("short_ccs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/short_ccs/1").to route_to("short_ccs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/short_ccs/1").to route_to("short_ccs#destroy", :id => "1")
    end

  end
end
