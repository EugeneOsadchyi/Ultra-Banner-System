class AdvertisingPlatformsController < ApplicationController
  before_action :set_advertising_platform, except: [:index, :new]

  def index
    @advertising_platforms = AdvertisingPlatform.all
  end

  def new
    @advertising_platform = AdvertisingPlatform.new
  end

  def show
    @banners = @advertising_platform.banners.order(id: :asc)
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

  def edit
  end

  def update
    respond_to do |format|
      if @advertising_platform.update(advertising_platform_params)
        format.html { redirect_to @advertising_platform, notice: 'Advertising platform successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @advertising_platform.destroy
    respond_to do |format|
      format.html { redirect_to advertising_platforms_url, notice: 'Advertising platform successfully destroyed.' }
    end
  end

  def advertisement
    if @advertising_platform.active?
      if @banner = @advertising_platform.relevant_banner
        @banner.increment!(:views_count)
        respond_to do |format|
          format.html { render layout: false }
        end
        return
      end

    end

    respond_to do |format|
      format.html { render nothing: true, status: 401 }
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
