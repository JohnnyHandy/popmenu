require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should have_many(:menu_items) }
  it { should belong_to(:restaurant) }
  subject { FactoryBot.create(:item) }
  it { should validate_uniqueness_of(:name).scoped_to(:restaurant_id) }
  it { should validate_presence_of(:name) }
end
