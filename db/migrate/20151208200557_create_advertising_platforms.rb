class CreateAdvertisingPlatforms < ActiveRecord::Migration
  def change
    create_table :advertising_platforms do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.boolean :active, null: false, default: true

      t.timestamps null: false
    end
  end
end
