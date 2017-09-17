require "rails_helper"

RSpec.describe ShowsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/shows").to route_to("shows#index")
    end

    it "routes to #new" do
      expect(:get => "/shows/new").to route_to("shows#new")
    end

    it "routes to #show" do
      expect(:get => "/shows/1").to route_to("shows#show", id: "1")
    end

    it "routes to #edit" do
      expect(:get => "/shows/1/edit").to route_to("shows#edit", id: "1")
    end

    it "routes to #create" do
      expect(:post => "/shows").to route_to("shows#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/shows/1").to route_to("shows#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/shows/1").to route_to("shows#update", id: "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/shows/1").to route_to("shows#destroy", id: "1")
    end
    
    it "routes to #search_tmdb" do
      expect(:post => "/shows/search_tmdb").to route_to("shows#search_tmdb")
    end
    
    it "routes to #search_id" do
      expect(:get => "/shows/search_id/1").to route_to("shows#search_id", id: "1")
    end
    
    it "routes to #get_ep" do
      expect(:get => "/shows/get_ep/1/2/3").to route_to("shows#get_ep", id: "1", season: "2", ep: "3")
    end
    
    it "routes to #get_ep_info" do
      expect(:get => "/shows/get_ep_info/1/2/3").to route_to("shows#get_ep_info", id: "1", season: "2", ep: "3")
    end
  end
end
