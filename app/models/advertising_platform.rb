class AdvertisingPlatform < ActiveRecord::Base
  has_many :banners

  before_validation :set_platform_name

  validates :name, presence: true
  validates :platform_name, presence: true
  validates :url, presence: true, url: true

  def set_platform_name
    self.platform_name = self.name.parameterize('_')
  end
end
