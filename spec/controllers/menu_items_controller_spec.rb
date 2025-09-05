require "rails_helper"

RSpec.describe MenuItemsController, type: :controller do
  describe "GET index" do
    it "index" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    it "index" do
      menu_item = create(:menu_item)
      get :show, params: { id: menu_item.id }
      expect(response).to have_http_status(:success)
    end
  end
end
