class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :name
      t.integer :bullet_post_id

      t.timestamps
    end
  end
end
