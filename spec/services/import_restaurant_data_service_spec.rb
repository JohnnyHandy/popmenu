require 'rails_helper'

RSpec.describe ImportRestaurantDataService, type: :service do
  describe "Case one: Assert creation of models" do
    let(:params) {
      {
        "restaurants": [
          {
            "name": "Poppo's Cafe",
            "menus": [
              {
                "name": "lunch",
                "menu_items": [
                  {
                    "name": "Burger",
                    "price": 9
                  },
                  {
                    "name": "Small Salad",
                    "price": 5
                  }
                ]
              },
              {
                "name": "dinner",
                "menu_items": [
                  {
                    "name": "Burger",
                    "price": 15
                  },
                  {
                    "name": "Large Salad",
                    "price": 8
                  }
                ]
              }
            ]
          },
          {
            "name": "Casa del Poppo",
            "menus": [
              {
                "name": "lunch",
                "dishes": [
                  {
                    "name": "Chicken Wings",
                    "price": 9
                  },
                  {
                    "name": "Burger",
                    "price": 9
                  },
                  {
                    "name": "Chicken Wings",
                    "price": 9
                  }
                ]
              },
              {
                "name": "dinner",
                "dishes": [
                  {
                    "name": "Mega \"Burger\"",
                    "price": 22
                  },
                  {
                    "name": "Lobster Mac & Cheese",
                    "price": 31
                  }
                ]
              }
            ]
          }
        ]
      }
    }

    it "Should create two Restaurants, 4 menus and 9 dishes" do
      expect { ImportRestaurantDataService.new(params).call }.to change(Restaurant, :count).by(2) and change(Menu, :count).by(4) and change(Item, :count).by(9)
    end
  end

  describe "Case two: Assert update of Item price" do
    let(:params) {
      {
        "restaurants": [
          "name": "Pop Restaurant",
          "menus": [
            {
              "name": "Pop Menu",
              "menu_items": [
                {
                  "name": "Pop Item",
                  "price": 30
                }
              ]
            }
          ]
        ]
      }
    }

    it "Should update item price" do
      restaurant = create(:restaurant, name: "Pop Restaurant")
      menu = create(:menu, restaurant: restaurant, name: "Pop Menu")
      item = create(:item, restaurant: restaurant, name: "Pop Item")
      menu_item = create(:menu_item, item: item, menu: menu)
      ImportRestaurantDataService.new(params).call
      expect(menu_item.reload.price).to eq(0.3e2)
    end
  end
end
