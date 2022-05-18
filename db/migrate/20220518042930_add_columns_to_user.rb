class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :course, :string
    add_column :users, :start_date, :date
    add_column :users, :end_date, :date
    add_column :users, :password_digest, :string
  end
end
