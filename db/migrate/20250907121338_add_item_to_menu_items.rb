class AddItemToMenuItems < ActiveRecord::Migration[8.0]
  def change
    add_reference :menu_items, :item, null: false, foreign_key: true
    remove_column :menu_items, :name
  end
end
