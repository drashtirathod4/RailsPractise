class GenerateRandomUserJob < ApplicationJob
  queue_as :default

  def perform(*args)
    user = User.new
    user.name = Faker::Name.name  
    user.email = Faker::Internet.email 
    user.phone = Faker::PhoneNumber.cell_phone
    user.dob = Faker::Time.between(from: 21.years.ago, to: 20.years.ago)  
    user.course = "ROR"
    user.start_date = Faker::Time.between(from: 4.months.ago, to: 3.months.ago)  
    user.end_date = Faker::Time.between(from: 1.months.ago, to: Date.today)  
    user.save!
    sleep 2
  end
end
