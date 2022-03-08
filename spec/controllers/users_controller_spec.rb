require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
    describe "GET index" do
        it "renders the index template" do
            get :index
            expect(response).to render_template("index")
            puts "Index page loaded"  
        end
    end

    describe "GET users#show" do
        it "should show users#show template" do
            user = create(:user)
            redirect_to user_path(user.id)
        end

        it 'checks that a user can be read' do
            expect(User.find_by_email("drashtir21@gmail.com")).to eq(@user)
        end
    end 

    describe 'create' do
        it 'successfully creates a new user' do
            user = User.create(name: "testuser", email: "test@mail.com")
            expect(User.last.name).to eq("testuser")
        end
    end

    describe "PUT users#update" do
        it "checks that a user can be updated" do
            @user = User.create(email: "123@mail.com", name: "Abc123")
            puts "Before Update : ", @user.name
            @user.update(:name => "Abc")
            expect(User.find_by_email("123@mail.com")).to eq(@user)
            puts "Successfully Updated!"
            puts "After Update: #{@user.name}"
        end
    end
    
    describe "DELETE users#destroy" do
        it 'checks that a user can be destroyed' do
            @user = User.find_by_name("Abc")
            @user.destroy
            # expect(User.count).to eq(0)
            puts "User #{@user.name} Deleted!"
        end        
    end
end
