class ChangeNameIndexOnItems < ActiveRecord::Migration[8.0]
  def change
    remove_index :items, name: :index_items_on_name
    add_reference :items, :restaurant, null: false, foreign_key: true
    add_index :items, [ :restaurant_id, :name ], unique: true
    add_index :menus, [ :restaurant_id, :name ], unique: true
    add_index :restaurants, :name, unique: true
  end
end
