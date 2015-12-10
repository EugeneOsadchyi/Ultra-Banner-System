class Banner < ActiveRecord::Base
  belongs_to :advertising_platform

  validates :name, presence: true
  validates :url, presence: true, url: true
  validates :max_views_count, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def incriment_clicks
    self.clicks_count += 1
  end

  def incriment_views
    self.views_count += 1
  end

  def reset_counters
    self.clicks_count = 0
    self.views_count = 0
  end
end
