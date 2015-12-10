require 'rails_helper'

RSpec.describe AdvertisingPlatformsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "renders the 'index' template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it "renders the 'new' template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "returns http success"
    it "renders the 'edit' template"
  end

  describe "GET #show" do
    it "returns http success"
    it "renders the 'show' template"
  end

end
