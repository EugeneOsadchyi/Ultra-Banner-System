class AddImageToBanners < ActiveRecord::Migration
  def change
    add_column :banners, :image, :string
  end
end
