class BannersController < ApplicationController
  before_action :set_banner, except: [:index, :new, :create]
  before_action :set_advertising_platform

  def index
    redirect_to @advertising_platform
  end

  def new
    @banner = @advertising_platform.banners.build
  end

  def create
    @banner = @advertising_platform.banners.build(banner_params)
    respond_to do |format|
      if @banner.save
        format.html { redirect_to advertising_platform_banner_path(@advertising_platform, @banner), notice: "Banner successfully created." }
      else
        format.html { redirect_to :new }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @banner.update(banner_params)
        format.html { redirect_to advertising_platform_banner_path(@advertising_platform, @banner), notice: 'Banner successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @banner.destroy
    respond_to do |format|
      format.html { redirect_to @advertising_platform, notice: "Bunner successfully deleted."}
    end
  end

  def click
    if @banner.enabled?
      @banner.increment_clicks!
      respond_to do |format|
        format.html { redirect_to @banner.url }
      end
    else
      # respond_to do |format|
      #   format.html { redirect_to Settings.fallback.url }
      # end
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
    params.require(:banner).permit(:name, :url, :max_views_count, :active)
  end
end
