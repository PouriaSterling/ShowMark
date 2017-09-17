require 'rails_helper'

RSpec.describe Show, type: :model do
    describe "attributes" do
        it "has a name attribute" do
            expect(FactoryGirl.build(:show)).to respond_to(:name)
        end
        
        it "has a season attribute" do
            expect(FactoryGirl.build(:show)).to respond_to(:season)
        end
        
        it "has a episode attribute" do
            expect(FactoryGirl.build(:show)).to respond_to(:episode)
        end
        
        it "has a image attribute" do
            expect(FactoryGirl.build(:show)).to respond_to(:image)
        end
        
        it "has a show ID attribute" do
            expect(FactoryGirl.build(:show)).to respond_to(:show_id)
        end
    end
    
    describe "associations" do
        it "belongs to a user do" do
            test_user = FactoryGirl.create(:user)
            test_show = FactoryGirl.build(:show)
            test_show.user = test_user
            test_show.save!
            expect(test_show.user).to eq(test_user)
        end
    end
  
end
