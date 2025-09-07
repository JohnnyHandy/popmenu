FactoryBot.define do
  factory :menu_item do
    menu { create(:menu) }
    item { create(:item) }
    price { 10 }
  end
end
