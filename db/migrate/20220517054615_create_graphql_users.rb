class CreateGraphqlUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :graphql_users do |t|
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
