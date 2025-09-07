require 'rails_helper'

RSpec.describe Menu, type: :model do
  it { should have_many(:menu_items) }
  it { should belong_to(:restaurant) }
end
