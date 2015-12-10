class AdvertisingPlatform < ActiveRecord::Base
  has_many :banners, dependent: :destroy

  before_validation :set_platform_name #TODO before_save not works. Need better solution

  validates :name, presence: true
  validates :platform_name, presence: true
  validates :url, presence: true, url: true
  validates :active, presence: true

  def set_platform_name
    self.platform_name = self.name.parameterize('_') if self.name
  end
end
