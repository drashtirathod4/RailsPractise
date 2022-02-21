class RemoveColumnFromTrainees < ActiveRecord::Migration[7.0]
  def change
    remove_column :trainees, :phone
  end
end
