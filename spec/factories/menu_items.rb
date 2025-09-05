FactoryBot.define do
  factory :menu_item do
    name { "Menu Item Name" }
    menu { create(:menu) }
    price { 10 }
  end
end
