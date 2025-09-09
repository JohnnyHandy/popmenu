class Restaurant < ApplicationRecord
  has_many :menus
  has_many :items

  validates_presence_of :name
end
