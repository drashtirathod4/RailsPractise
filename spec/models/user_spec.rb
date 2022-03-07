require 'rails_helper'

RSpec.describe User, type: :model do
    before do 
        @user = User.new(email: "drashti@gmail.com", name: "Drashti")
    end

    it "should be valid with valid attributes" do
        @user.email = nil
        expect(@user).to_not be_valid 
    end
    
    it "factory bot" do
        user = FactoryBot.create(:user)
        expect(user).to be_valid
    end
end
