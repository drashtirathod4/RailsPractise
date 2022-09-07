class CreateMyAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :my_authors do |t|
      t.string :name

      t.timestamps
    end
  end
end
