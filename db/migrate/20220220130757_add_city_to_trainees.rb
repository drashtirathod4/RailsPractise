class AddCityToTrainees < ActiveRecord::Migration[7.0]
  def change
    add_reference :trainees, :city, foreign_key: true
  end
end
