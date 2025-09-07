class Item < ApplicationRecord
  has_many :menu_items
  validates_uniqueness_of :name
end
