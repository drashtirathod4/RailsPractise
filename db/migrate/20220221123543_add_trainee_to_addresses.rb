class AddTraineeToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_reference :addresses, :trainee, null: false, foreign_key: true
  end
end
