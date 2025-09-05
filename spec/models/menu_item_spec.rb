require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  it { should belong_to(:menu) }
  it { should validate_presence_of(:menu) }

end
