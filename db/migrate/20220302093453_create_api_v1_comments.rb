class CreateApiV1Comments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :description
      t.references :api_v1_post, null: false, foreign_key: true
      t.timestamps
    end
  end
end
