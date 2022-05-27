class CreateUserJob < ApplicationJob
  queue_as :default

  def perform(*args)
    user = User.new
    user.name = "Drashti"
    user.email = "drashtir9@gmail.com"
    user.save!
    sleep 2
  end
end
