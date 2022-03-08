require 'rails_helper'

RSpec.describe User, type: :model do
    # let(:user) { build(:user) }
    subject { User.new(name: "Drashti", email: "drashtii@gmail.com", password: "12345678") }
    before { subject.save }

    # before do 
    #     @user = User.new(email: "drashti@gmail.com", name: "Drashti")
    # end

    it "should be valid with valid attributes" do
        # subject.email = nil
        expect(subject).to be_valid 
    end

    it "name should be present" do
        subject.name = nil
        expect(subject).to_not be_valid
    end  

    it "name should not be too long" do
        subject.name *= 25 
        expect(subject).to be_valid
    end  
    
    it "factory bot" do
        user = FactoryBot.create(:user)
        expect(user).to be_valid
        puts "Name : #{user.name}"
        puts "Email: #{user.email}"
    end

    it "password should be present" do
        user = FactoryBot.create(:user)
        expect(user).to be_valid
        puts "Name : #{user.name}"
        puts "Email: #{user.email}"
        puts "Password: #{user.password}"
        puts "Phone: #{user.phone}"
    end

    it "password shoudln't be too short" do
        @user = User.create(name: "abd", email: "abd@mail.com", password: "abc1234")
        expect(@user).to be_valid
    end
end
