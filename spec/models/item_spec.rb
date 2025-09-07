require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should have_many(:menu_items) }
  it { should validate_uniqueness_of(:name) }
end
