require "rails_helper"

RSpec.describe ShotCpsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/shot_cps").to route_to("shot_cps#index")
    end

    it "routes to #new" do
      expect(:get => "/shot_cps/new").to route_to("shot_cps#new")
    end

    it "routes to #show" do
      expect(:get => "/shot_cps/1").to route_to("shot_cps#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/shot_cps/1/edit").to route_to("shot_cps#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/shot_cps").to route_to("shot_cps#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/shot_cps/1").to route_to("shot_cps#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/shot_cps/1").to route_to("shot_cps#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/shot_cps/1").to route_to("shot_cps#destroy", :id => "1")
    end

  end
end
