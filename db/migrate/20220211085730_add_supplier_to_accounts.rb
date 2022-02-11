class AddSupplierToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_reference :accounts, :supplier,index: { unique: true }, foreign_key: true
  end
end
