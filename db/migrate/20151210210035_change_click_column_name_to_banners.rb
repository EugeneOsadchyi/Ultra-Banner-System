class ChangeClickColumnNameToBanners < ActiveRecord::Migration
  def up
    rename_column :banners, :click_count, :clicks_count
  end

  def down
    rename_column :banners, :clicks_count, :click_count
  end
end
