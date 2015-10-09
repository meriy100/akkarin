require "rails_helper"

RSpec.describe ShortCutContentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/short_cut_contents").to route_to("short_cut_contents#index")
    end

    it "routes to #new" do
      expect(:get => "/short_cut_contents/new").to route_to("short_cut_contents#new")
    end

    it "routes to #show" do
      expect(:get => "/short_cut_contents/1").to route_to("short_cut_contents#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/short_cut_contents/1/edit").to route_to("short_cut_contents#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/short_cut_contents").to route_to("short_cut_contents#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/short_cut_contents/1").to route_to("short_cut_contents#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/short_cut_contents/1").to route_to("short_cut_contents#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/short_cut_contents/1").to route_to("short_cut_contents#destroy", :id => "1")
    end

  end
end
