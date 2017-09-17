require "rails_helper"

RSpec.describe ShowsController, type: :routing do
    describe "routing" do
      
        it "routes to sessions#create" do
          expect(:get => "auth/facebook/callback").to route_to("sessions#create", provider: "facebook")
        end
        
        it "routes to sessions#destroy" do
          expect(:post => "/logout").to route_to("sessions#destroy")
        end
        
        it "routes to sessions#failure" do
          expect(:get => "/auth/failure").to route_to("sessions#failure")
        end
        
    end
end