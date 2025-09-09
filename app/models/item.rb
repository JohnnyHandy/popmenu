class Item < ApplicationRecord
  has_many :menu_items
  belongs_to :restaurant
  validates :name, presence: true, uniqueness: { scope: :restaurant_id }
end
