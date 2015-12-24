class AdvertisingPlatform < ActiveRecord::Base
  has_many :banners, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :url, presence: true, url: true

  def view_relevant_banner
    Banner.transaction do
      @banner = banners.for_rotation.lock.first
      if @banner
        @banner.increment_views
        @banner.save!
      end
    end
    @banner
  end
end
