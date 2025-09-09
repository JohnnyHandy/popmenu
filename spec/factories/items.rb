FactoryBot.define do
  factory :item do
    name { "Item Name" }
    restaurant { create(:restaurant) }
  end
end
