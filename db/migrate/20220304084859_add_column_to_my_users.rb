class AddColumnToMyUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :my_users, :name, :string
    add_column :my_users, :phone, :string
    add_column :my_users, :address, :text
  end
end
