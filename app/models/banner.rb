class Banner < ActiveRecord::Base
  belongs_to :advertising_platform
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :url, presence: true, url: true
  validates :max_views_count, presence: true, numericality: { only_integer: true, greater_than: 0 }
  # @todo Сделать image обязательным полем

  # Неверно выбрана сортировка.
  # В случае добавлени нового банера, будет показываться только он, напротяжении долгого времени (пока не догонит по кол-ву просмотров следующий)
  scope :for_rotation, -> { where(active: true).where('views_count < max_views_count').where.not(image: nil).order(views_count: :asc) }

  def enabled?
    self.active? && self.views_count <= self.max_views_count
  end

  # Rails автоматически генерит метод column_name? для boolean полей
  def active?
    self.active
  end

  # Этот метод не будет работать при более чем одном паралельном запросе (несколько паралельных запросов увеличат счетчик только на 1)
  # @todo Переписать метод для поддержки concurrent requests
  def increment_clicks!
    self.increment(:clicks_count)
    self.save
  end

  # @todo Переписать метод для поддержки concurrent requests
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
