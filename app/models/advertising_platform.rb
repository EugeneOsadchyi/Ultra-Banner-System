class AdvertisingPlatform < ActiveRecord::Base
  has_many :banners, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :url, presence: true, url: true

  def relevant_banner
    banners.for_rotation.lock.first
  end
end
