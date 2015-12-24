class Banner < ActiveRecord::Base
  belongs_to :advertising_platform
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :url, presence: true, url: true
  validates :image, presence: true
  validates :max_views_count, presence: true, numericality: { only_integer: true, greater_than: 0 }

  scope :for_rotation, -> { where(active: true).where('views_count < max_views_count').where.not(image: nil).order(:updated_at) }

  def enabled?
    active? && views_count <= max_views_count
  end

  def increment_views
    self.views_count += 1 # self.increment(:views_count) is better, but I need to update updated_at value for sort
  end

  def reset_counters!
    update(clicks_count: 0, views_count: 0)
  end

  class << self
    def increment_clicks(banner_id)
      where(id: banner_id).update_all("clicks_count = COALESCE(clicks_count, 0) + 1, updated_at = '#{Time.current.to_s(:db)}'")
    end

    def increment_views(banner_id)
      where(id: banner_id).update_all("views_count = COALESCE(views_count, 0) + 1, updated_at = '#{Time.current.to_s(:db)}'")
    end

    def reset_counters(banner_id)
      where(id: banner_id).update_all(clicks_count: 0, views_count: 0)
    end
  end
end
