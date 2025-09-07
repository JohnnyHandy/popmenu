FactoryBot.define do
  factory :menu do
    name { "Menu Name" }
    restaurant { create(:restaurant) }
  end
end
