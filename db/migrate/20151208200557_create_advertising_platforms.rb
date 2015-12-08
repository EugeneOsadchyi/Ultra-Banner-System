class CreateAdvertisingPlatforms < ActiveRecord::Migration
  def change
    create_table :advertising_platforms do |t|
      t.string :name
      t.string :platform_name
      t.string :url

      t.timestamps null: false
    end
  end
end
