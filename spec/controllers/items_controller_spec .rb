require "rails_helper"

RSpec.describe ItemsController, type: :controller do
  describe "GET index" do
    it "index" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    it "index" do
      item = create(:item)
      get :show, params: { id: item.id }
      expect(response).to have_http_status(:success)
    end
  end
end
