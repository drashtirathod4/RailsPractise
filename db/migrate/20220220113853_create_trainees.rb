class CreateTrainees < ActiveRecord::Migration[7.0]
  def change
    create_table :trainees do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :phone
      t.string :gender
      t.string :hobbies
      t.date :dob

      t.timestamps
    end
  end
end
