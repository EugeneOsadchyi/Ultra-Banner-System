require 'rails_helper'

RSpec.describe AdvertisingPlatform, type: :model do

  before do
    @advertising_platform = AdvertisingPlatform.new(name: 'Ultra Turbo Rocket', platform_name: 'ultra_turbo_rocket', url: 'http://uturbo.pp.ua/')
  end

  subject { @advertising_platform }

  it { should respond_to(:name) }
  it { should respond_to(:platform_name) }
  it { should respond_to(:url) }
  it { should respond_to(:active) }

  it "should be active by default" do
    expect(@advertising_platform.active).to eq(true)
  end

  it { should be_valid }

  describe "when platform_name is not present" do
    before { @advertising_platform = AdvertisingPlatform.new(name: 'Ultra Turbo Rocket Team', url: 'http://uturbo.pp.ua/') }

    it "should set platform_name on before validation" do
      @advertising_platform.save
      expect(@advertising_platform.platform_name).to eq('ultra_turbo_rocket_team')
    end
  end

  describe "when not valid url is provided" do
    it "should be invalid" do
      urls = %w[tp://uturbo.pp.ua/ a@b.com www httpd://example.com example!com]
      urls.each do |invalid_url|
        @advertising_platform.url = invalid_url
        expect(@advertising_platform).not_to be_valid
      end
    end
  end

  describe "when valid url is provided" do
    it "should be valid" do
      urls = %w[http://uturbo.pp.ua/ http://example.com https://cono.ebash.it/] #TODO Need fix www.example.com and http://www.example.com/ are invalid here
      urls.each do |valid_url|
        @advertising_platform.url = valid_url
        expect(@advertising_platform).to be_valid
      end
    end
  end

  describe "when name is not provided" do
    before { @advertising_platform = AdvertisingPlatform.new(url: 'http://uturbo.pp.ua/') }

    it "should be invalid" do
      @advertising_platform.save
      expect(@advertising_platform).not_to be_valid
    end
  end

  describe "when name is already in list" do
    before do
      @advertising_platform_with_same_name = @advertising_platform.dup
      @advertising_platform_with_same_name.name = @advertising_platform.name.upcase
      @advertising_platform_with_same_name.save
    end

    it { should_not be_valid }
  end

end
