class AddIndexToUser < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :name, if_not_exists: true
    add_index :users, :email, if_not_exists: true
  end
end
