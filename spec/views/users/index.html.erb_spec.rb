require 'rails_helper'

RSpec.describe "users/index", type: :view do
    before(:each) do
        assign(:users, [
            User.create!(
                name: "Xyz",
                email: "abc@mail.com"
            ),
            User.create!(
                name: "Abc",
                email: "xyz@mail.com"
            )
        ])
    end

    it "renders a list of users" do
        render
        assert_select "tr>td", :text => /Name/, count: 2
        assert_select "tr>td", :text => /Email/, count: 2
    end
end
