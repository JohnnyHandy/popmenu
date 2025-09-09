class RestaurantValidator < ActiveModel::Validator
  def set_invalid_record_association(record, message)
    record.errors.add :menu_item, message: message
  end

  def validate(record)
    unless record.menu.blank? || record&.item&.blank?
      set_invalid_record_association(record, "Menu Restaurant must be the same as Item Restaurant") if record&.menu.restaurant_id != record&.item.restaurant_id
    end
  end
end

class MenuItem < ApplicationRecord
  belongs_to :menu
  belongs_to :item
  validates :menu, :item, presence: true
  validates_with RestaurantValidator
end
