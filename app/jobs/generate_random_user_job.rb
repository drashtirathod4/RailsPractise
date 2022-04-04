class GenerateRandomUserJob < ApplicationJob
  queue_as :default

  def perform(*args)
    user = User.new
    user.name = Faker::Name.name  
    user.email = Faker::Internet.email  
    user.save!
    sleep 2
  end
end
