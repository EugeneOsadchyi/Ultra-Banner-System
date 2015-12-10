class AdvertisingPlatformsController < ApplicationController
  before_action :set_advertising_platform, only: [:show, :destroy]

  def index
    @advertising_platforms = AdvertisingPlatform.all
  end

  def new
    @advertising_platform = AdvertisingPlatform.new
  end

  def show
    @banners = @advertising_platform.banners
  end

  def create
    @advertising_platform = AdvertisingPlatform.new(advertising_platform_params)
    respond_to do |format|
      if @advertising_platform.save
        format.html { redirect_to @advertising_platform, notice: 'Advertising platform successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @advertising_platform.destroy
    respond_to do |format|
      format.html { redirect_to advertising_platforms_url }
      format.json { head :no_content }
    end
  end

  private
  def set_advertising_platform
    @advertising_platform ||= AdvertisingPlatform.find(params[:id])
  end

  def advertising_platform_params
    params.require(:advertising_platform).permit(:name, :url, :active)
  end
end
