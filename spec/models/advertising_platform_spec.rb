require 'rails_helper'

RSpec.describe AdvertisingPlatform, type: :model do
  let(:advertising_platform) { FactoryGirl.create(:advertising_platform) }

  subject { advertising_platform }

  it { should respond_to(:name) }
  it { should respond_to(:url) }
  it { should respond_to(:active) }

  it { should be_valid }

  it "should be active by default" do
    expect(advertising_platform.active).to eq(true)
  end


  describe "when not valid url is provided" do
    it "should be invalid" do
      urls = %w[tp://uturbo.pp.ua/ a@b.com www httpd://example.com example!com]
      urls.each do |invalid_url|
        advertising_platform.url = invalid_url
        expect(advertising_platform).not_to be_valid
      end
    end
  end

  describe "when valid url is provided" do
    it "should be valid" do
      urls = %w[http://uturbo.pp.ua/ http://example.com https://cono.ebash.it/] #TODO Need fix www.example.com and http://www.example.com/ are invalid here
      urls.each do |valid_url|
        advertising_platform.url = valid_url
        expect(advertising_platform).to be_valid
      end
    end
  end

end
