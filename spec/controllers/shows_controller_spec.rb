require 'rails_helper'

RSpec.describe ShowsController, type: :controller do

  # # This should return the minimal set of attributes required to create a valid
  # # Show. As you add validations to Show, be sure to
  # # adjust the attributes here as well.
  # let(:valid_attributes) {
  #   skip("Add a hash of attributes valid for your model")
  # }

  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }

  # # This should return the minimal set of values that should be in the session
  # # in order to pass any filters (e.g. authentication) defined in
  # # ShowsController. Be sure to keep this updated too.
  # let(:valid_session) { {} }

  # describe "GET #index" do
  #   it "returns a success response" do
  #     show = Show.create! valid_attributes
  #     get :index, {}, valid_session
  #     expect(response).to be_success
  #   end
  # end

  # describe "GET #show" do
  #   it "returns a success response" do
  #     show = Show.create! valid_attributes
  #     get :show, {:id => show.to_param}, valid_session
  #     expect(response).to be_success
  #   end
  # end

  # describe "GET #new" do
  #   it "returns a success response" do
  #     get :new, {}, valid_session
  #     expect(response).to be_success
  #   end
  # end

  # describe "GET #edit" do
  #   it "returns a success response" do
  #     show = Show.create! valid_attributes
  #     get :edit, {:id => show.to_param}, valid_session
  #     expect(response).to be_success
  #   end
  # end

  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new Show" do
  #       expect {
  #         post :create, {:show => valid_attributes}, valid_session
  #       }.to change(Show, :count).by(1)
  #     end

  #     it "redirects to the created show" do
  #       post :create, {:show => valid_attributes}, valid_session
  #       expect(response).to redirect_to(Show.last)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "returns a success response (i.e. to display the 'new' template)" do
  #       post :create, {:show => invalid_attributes}, valid_session
  #       expect(response).to be_success
  #     end
  #   end
  # end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested show" do
  #       show = Show.create! valid_attributes
  #       put :update, {:id => show.to_param, :show => new_attributes}, valid_session
  #       show.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "redirects to the show" do
  #       show = Show.create! valid_attributes
  #       put :update, {:id => show.to_param, :show => valid_attributes}, valid_session
  #       expect(response).to redirect_to(show)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "returns a success response (i.e. to display the 'edit' template)" do
  #       show = Show.create! valid_attributes
  #       put :update, {:id => show.to_param, :show => invalid_attributes}, valid_session
  #       expect(response).to be_success
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "destroys the requested show" do
  #     show = Show.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => show.to_param}, valid_session
  #     }.to change(Show, :count).by(-1)
  #   end

  #   it "redirects to the shows list" do
  #     show = Show.create! valid_attributes
  #     delete :destroy, {:id => show.to_param}, valid_session
  #     expect(response).to redirect_to(shows_url)
  #   end
  # end

end
