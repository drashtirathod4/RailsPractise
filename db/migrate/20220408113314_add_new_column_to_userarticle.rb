class AddNewColumnToUserarticle < ActiveRecord::Migration[7.0]
  def change
    add_column :userarticles, :published, :boolean
  end
end
