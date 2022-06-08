class AddSearchIndexToUsers < ActiveRecord::Migration[7.0]
  def up
    execute "create index users_name on users using gin(to_tsvector('english',name))"
    execute "create index users_email on users using gin(to_tsvector('english',email))"
  end
  def down
    execute "drop index users_name"
    execute "drop index users_email"
  end
end
