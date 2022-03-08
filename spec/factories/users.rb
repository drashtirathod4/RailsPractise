FactoryBot.define do
    factory :user do
        name { Faker::Name.unique.name }
        email { Faker::Internet.unique.email }
        password {Faker::Internet.unique.password}
        phone { Faker::PhoneNumber.cell_phone }
    end
end
