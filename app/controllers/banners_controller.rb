class BannersController < ApplicationController
  before_action :authenticate_admin!, except: [:click]
  before_action :set_banner, except: [:index, :new, :create, :reset]
  before_action :set_advertising_platform, except: [:show, :reset, :click]

  def index
    redirect_to @advertising_platform
  end

  def new
    @banner = @advertising_platform.banners.build
  end

  def create
    @banner = @advertising_platform.banners.build(banner_params)
    if @banner.save
      redirect_to advertising_platform_banner_path(@advertising_platform, @banner), success: 'Banner successfully created.'
    else
      redirect_to :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @banner.update(banner_params)
      redirect_to advertising_platform_banner_path(@advertising_platform, @banner), success: 'Banner successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @banner.destroy
    redirect_to @advertising_platform, success: 'Banner successfully deleted.'
  end

  def reset
    Banner.reset_counters(params[:id])
    redirect_to :back
  end

  def click
    if @banner.enabled?
      Banner.increment_clicks(@banner.id)
      redirect_to @banner.url
    else
      redirect_to Settings.fallback.url
    end
  end

  private
  def set_banner
    @banner ||= Banner.find(params[:id])
  end

  def set_advertising_platform
    @advertising_platform ||= AdvertisingPlatform.find(params[:advertising_platform_id])
  end

  def banner_params
    params.require(:banner).permit(:name, :url, :max_views_count, :image, :remote_image_url, :active)
  end
end
