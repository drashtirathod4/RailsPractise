class AddAccountToAccountHistories < ActiveRecord::Migration[7.0]
  def change
    add_reference :account_histories, :account,index: { unique: true }, foreign_key: true
  end
end
