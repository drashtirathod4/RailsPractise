class GenerateRandomUserJob < ApplicationJob
  queue_as :default

  def perform(*args)
    user = User.new
    user.name = "Drashti"
    user.email = "drashtir@gmail.com"
    user.save!
  end
end
