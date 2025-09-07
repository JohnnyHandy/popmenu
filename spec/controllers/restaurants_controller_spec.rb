require "rails_helper"

RSpec.describe RestaurantsController, type: :controller do
  describe "GET index" do
    it "index" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    it "index" do
      restaurant = create(:restaurant)
      get :show, params: { id: restaurant.id }
      expect(response).to have_http_status(:success)
    end
  end
end
