class Banner < ActiveRecord::Base
  belongs_to :advertising_platform

  validates :name, presence: true
  validates :url, presence: true, url: true
  validates :max_views_count, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
