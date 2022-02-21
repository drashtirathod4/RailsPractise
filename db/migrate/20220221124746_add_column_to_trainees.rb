class AddColumnToTrainees < ActiveRecord::Migration[7.0]
  def change
    add_column :trainees, :image, :string
  end
end
