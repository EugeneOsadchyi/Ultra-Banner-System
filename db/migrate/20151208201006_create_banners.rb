class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.belongs_to :advertising_platform, index: true
      t.string :name, null: false
      t.string :url, null: false
      t.integer :views_count, null: false, default: 0
      t.integer :max_views_count, null: false, default: 1
      t.integer :click_count, null: false, default: 0
      t.boolean :active, null: false, default: true

      t.timestamps null: false
    end
  end
end
