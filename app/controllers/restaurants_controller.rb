class RestaurantsController < ApplicationController
  before_action :set_menu, only: %i[ show update destroy ]

  # GET /restaurant
  def index
    @restaurant = Restaurant.all

    render json: @restaurant
  end

  # GET /restaurant/1
  def show
    render json: @restaurant
  end

  # POST /restaurant
  def create
    @restaurant = Restaurant.new(menu_params)

    if @restaurant.save
      render json: @restaurant, status: :created, location: @restaurant
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /restaurant/1
  def update
    if @restaurant.update(menu_params)
      render json: @restaurant
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /restaurant/1
  def destroy
    @restaurant.destroy!
  end

  def import_json_data
    result = ImportRestaurantDataService.new(import_json_data_params).call
    render json: result
  end

  private

    def import_json_data_params
      params.permit(restaurants: [ menus: [ :menu_items, :dishes ] ])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @restaurant = Restaurant.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def menu_params
      params.expect(restaurant: [ :name ])
    end
end
