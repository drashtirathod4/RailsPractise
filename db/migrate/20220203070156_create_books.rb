class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :year
      t.string :isbn
      t.decimal :price
      t.integer :views

      t.timestamps
    end
  end
end
