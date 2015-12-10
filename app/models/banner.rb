class Banner < ActiveRecord::Base
  belongs_to :advertising_platform

  validates :name, presence: true
  validates :url, presence: true, url: true
  validates :max_views_count, presence: true, numericality: { only_integer: true, greater_than: 0 }

  scope :for_rotation, -> { where(active: true).where('views_count < max_views_count').order(views_count: :asc) }

  def enabled?
    self.active && self.views_count <= self.max_views_count
  end

  def increment_clicks!
    self.clicks_count += 1
    self.save
  end

  def increment_views!
    self.views_count += 1
    self.save
  end

  def reset_counters!
    self.clicks_count = 0
    self.views_count = 0
    self.save
  end
end
