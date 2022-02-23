class CreateAds < ActiveRecord::Migration[7.0]
  def change
    create_table :ads do |t|
      t.string :ad_name
      t.references :magazine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
