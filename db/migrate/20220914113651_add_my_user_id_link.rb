class AddMyUserIdLink < ActiveRecord::Migration[7.0]
  def change
    change_table :links do |t|
      t.references :my_user, foreign_key: true
    end
  end
end
