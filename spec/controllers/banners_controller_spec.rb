require 'rails_helper'

RSpec.describe BannersController, type: :controller do

  describe "GET #index" do
    it "returns http success" # do
#       get :index, use_route: :advertising_platforms
#       expect(response).to have_http_status(:success)
#     end
    it "renders the 'show' template of advertising platforms controller" # do
#       get :index, use_route: :advertising_platforms
#       expect(response).to render_template('advertising_platforms/show')
#     end
  end

  describe "GET #new" do
    it "returns http success" # do
#       get :new, use_route: :advertising_platforms
#       expect(response).to have_http_status(:success)
#     end
    it "renders the 'new' template" # do
#       get :new, use_route: :advertising_platforms
#       expect(response).to render_template(:new)
#     end
  end

  describe "GET #edit" do
    it "returns http success"
  end

  describe "GET #show" do
    it "returns http success"
  end

end
