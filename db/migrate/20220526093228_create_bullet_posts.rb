class CreateBulletPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :bullet_posts do |t|
      t.string :name

      t.timestamps
    end
  end
end
