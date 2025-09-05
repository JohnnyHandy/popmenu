require "rails_helper"

RSpec.describe MenusController, type: :controller do
  describe "GET index" do
    it "index" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    it "index" do
      menu = create(:menu)
      get :show, params: { id: menu.id }
      expect(response).to have_http_status(:success)
    end
  end
end
