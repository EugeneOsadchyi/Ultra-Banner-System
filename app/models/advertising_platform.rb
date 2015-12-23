class AdvertisingPlatform < ActiveRecord::Base
  has_many :banners, dependent: :destroy

  # callback неудачное место для выставления platform_name
  # Т.к. это зависимый аттрибут, то лучше переопределить name=
  before_validation :set_platform_name #TODO before_save not works. Need better solution

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :platform_name, presence: true
  validates :url, presence: true, url: true

  # Rails автоматически генерит метод column_name? для boolean полей
  def active?
    self.active
  end

  def relevant_banner
    # В этом (и большинстве других случаев) явное указание конткста self. лишнее
    self.banners.for_rotation.first
  end

  private
  def set_platform_name
    self.platform_name = self.name.parameterize('_') if self.name
  end
end
