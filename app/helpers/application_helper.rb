module ApplicationHelper
  def domain(path)
    unless Settings.port.blank?
      "#{Settings.protocol}://#{Settings.domain}:#{Settings.port}#{path}"
    else
      "#{Settings.protocol}://#{Settings.domain}#{path}"
    end
  end
end
