FactoryBot.define do
  factory :menu_item do
    menu { create(:menu) }
    item { create(:item, restaurant: menu.restaurant) }
    price { 10 }
  end
end
