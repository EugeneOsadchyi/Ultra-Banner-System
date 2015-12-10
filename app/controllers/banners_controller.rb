class BannersController < ApplicationController
  before_action :set_advertising_platform, only: [:index, :new, :create]
  before_action :set_banner, only: [:destroy, :show]

  def index
    redirect_to @advertising_platform
  end

  def new
    @banner = @advertising_platform.banners.build
  end

  def show
  end

  def create
    @banner = @advertising_platform.banners.build(banner_params)
    respond_to do |format|
      if @banner.save
        format.html { redirect_to @banner, notice: "Banner successfully created." }
      else
        format.html { redirect_to :new }
      end
    end
  end

  def destroy
    advertising_platform_id = @banner.advertising_platform_id
    @banner.destroy
    respond_to do |format|
      format.html { redirect_to advertising_platform_path(advertising_platform_id), notice: "Bunner successfully deleted."}
    end
  end

  private
  def set_banner
    @banner = Banner.find(params[:id])
  end

  def set_advertising_platform
    @advertising_platform = AdvertisingPlatform.find(params[:advertising_platform_id])
  end

  def banner_params
    params.require(:banner).permit(:name, :url, :max_view_count, :active)
  end
end
