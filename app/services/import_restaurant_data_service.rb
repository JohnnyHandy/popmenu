class ImportRestaurantDataService
  def initialize(params)
    @params = params.to_h.deep_stringify_keys
  end

  def call
    result = []
    begin
      @params.dig("restaurants")&.each do |restaurant_data|
      restaurant_name = restaurant_data["name"]
      restaurant = Restaurant.find_or_create_by(name: restaurant_name)
      if restaurant.save!
        result << { success: true, restaurant: restaurant_name }
        restaurant_menus = restaurant_data.dig("menus")
        restaurant_menus.each do |menu_data|
            menu_name = menu_data["name"]
            menu = Menu.find_or_create_by(name: menu_name, restaurant_id: restaurant.id)
            if menu.save!
              result << { success: true, restaurant: restaurant_name, menu: menu_name }
              menu_dishes = [ menu_data.dig("menu_items"), menu_data.dig("dishes") ].compact.flatten
              menu_dishes.each do |item_data|
                item_name = item_data["name"]
                item_price = item_data["price"]
                item = Item.find_or_create_by(restaurant_id: restaurant.id, name: item_name)
                menu_item = MenuItem.find_or_initialize_by(item_id: item.id, menu_id: menu.id)
                menu_item.price = item_price
                if item.save! && menu_item.save!
                  result << { success: true, restaurant: restaurant_name, menu: menu_name, item: item_name }
                else
                  result << { success: false, restaurant: restaurant_name, menu: menu_name, item: item_name, errors: (item.errors | menu_item.errors).pluck(:message).join("-") }
                end
              end
            else
              result << { success: false, restaurant: restaurant_name, menu: menu_name, errors: menu.errors.pluck(:message).join("-") }
            end
        end
      else
        result << { success: false, restaurant: restaurant_name, errors: restaurant.errors.pluck(:message).join("-") }
      end
    end
    rescue => e
      result << { success: false, error: e.message }
    end
    result
  end
end
