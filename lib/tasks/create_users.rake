task create_users: :environment do
    25.times do
        name = Faker::Name.unique.name
        course = "ROR"
        User.create(name: name, course: course)
    end

    25.times do 
        name = Faker::Name.unique.name
        course = "Python"
        User.create(name: name, course: course)
    end
end
