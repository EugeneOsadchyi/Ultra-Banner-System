require 'rails_helper'

RSpec.describe AdvertisingPlatformsController, type: :controller do
  login_admin

  let(:advertising_platform) { create(:advertising_platform) }

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
    it "returns http success" do
      get :edit, { id: advertising_platform.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the 'edit' template" do
      get :edit, { id: advertising_platform.id }
      expect(response).to render_template(:edit)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, { id: advertising_platform.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the 'show' template" do
      get :show, { id: advertising_platform.id }
      expect(response).to render_template(:show)
    end
  end

end
