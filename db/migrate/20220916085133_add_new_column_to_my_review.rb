class AddNewColumnToMyReview < ActiveRecord::Migration[7.0]
  def change
    add_column :my_reviews, :secret, :string
  end
end
