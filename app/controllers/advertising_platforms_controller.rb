class AdvertisingPlatformsController < ApplicationController
  before_action :set_advertising_platform, only: []

  def index
  end

  private
  def set_advertising_platform
    @advertising_platform ||= AdvertisingPlatform.find(params[:id])
  end

  def advertising_platform_params
    params.require(:advertising_platfor).permit(:name, :url, :active)
  end
end
