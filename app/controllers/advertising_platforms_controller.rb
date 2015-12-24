class AdvertisingPlatformsController < ApplicationController
  before_action :authenticate_admin!, except: [:advertisement]
  before_action :set_advertising_platform, except: [:index, :new, :create]

  def index
    @advertising_platforms = AdvertisingPlatform.order(:id).page(params[:page])
  end

  def new
    @advertising_platform = AdvertisingPlatform.new
  end

  def show
    @banners = @advertising_platform.banners.order(:id).page(params[:page])
  end

  def create
    @advertising_platform = AdvertisingPlatform.new(advertising_platform_params)

    if @advertising_platform.save
      redirect_to @advertising_platform, notice: 'Advertising platform successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @advertising_platform.update(advertising_platform_params)
      redirect_to advertising_platforms_url, notice: 'Advertising platform successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @advertising_platform.destroy
    redirect_to advertising_platforms_url, notice: 'Advertising platform successfully destroyed.'
  end

  def advertisement
    if @advertising_platform.active?
      Banner.transaction do # Maybe I am wrong
        if @banner = @advertising_platform.relevant_banner
          @banner.lock
          Banner.increment_views(@banner.id)
          render layout: false
          return
        end
      end
    end
    render nothing: true, status: 401
  end

  private
  def set_advertising_platform
    @advertising_platform ||= AdvertisingPlatform.find(params[:id])
  end

  def advertising_platform_params
    params.require(:advertising_platform).permit(:name, :url, :active)
  end
end
