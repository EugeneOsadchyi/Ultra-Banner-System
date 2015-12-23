class Banner < ActiveRecord::Base
  belongs_to :advertising_platform
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :url, presence: true, url: true
  validates :max_views_count, presence: true, numericality: { only_integer: true, greater_than: 0 }

  scope :for_rotation, -> { where(active: true).where('views_count < max_views_count').where.not(image: nil).order(:views_count) }

  def enabled?
    self.active? && self.views_count <= self.max_views_count
  end

  def increment_clicks!
    self.increment(:clicks_count)
    self.save
  end

  def increment_views!
    self.increment(:views_count)
    self.save
  end

  def reset_counters!
    self.clicks_count = 0
    self.views_count = 0
    self.save
  end
end
