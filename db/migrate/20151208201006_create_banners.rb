class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :name
      t.string :url
      t.integer :views_count
      t.integer :max_views_count
      t.integer :click_count

      t.timestamps null: false
    end
  end
end
