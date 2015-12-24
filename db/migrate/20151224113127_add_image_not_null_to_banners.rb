class AddImageNotNullToBanners < ActiveRecord::Migration
  def change
    change_column_null :banners, :image, false
  end
end
