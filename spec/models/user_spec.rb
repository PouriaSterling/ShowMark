require 'rails_helper'

RSpec.describe User, type: :model do
    describe "attributes" do
        
        it "has a name attribute" do
            expect(FactoryGirl.build(:user)).to respond_to(:name)
        end
        
        it "has a provider attribute" do
            expect(FactoryGirl.build(:user)).to respond_to(:provider)
        end
        
        it "has a uid attribute" do
            expect(FactoryGirl.build(:user)).to respond_to(:uid)
        end
        
    end
    
    describe "associations" do
        it "contains many shows" do
            test_user = FactoryGirl.build(:user)
            test_show_1 = FactoryGirl.create(:show)
            test_show_2 = FactoryGirl.create(:show)
            test_show_3 = FactoryGirl.create(:show)
            test_user.shows << test_show_1
            test_user.shows << test_show_2
            test_user.shows << test_show_3
            test_user.save!
            
            shows = test_user.shows.to_a
            expect(shows[0]).to eq(test_show_1)
            expect(shows[1]).to eq(test_show_2)
            expect(shows[2]).to eq(test_show_3)
        end
    end
end
