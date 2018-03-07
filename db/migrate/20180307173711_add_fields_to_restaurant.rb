class AddFieldsToRestaurant < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :address, :string
    add_column :restaurants, :neighbourhood, :string
    add_column :restaurants, :price_range, :string
    add_column :restaurants, :summary, :text
    add_column :restaurants, :restaurant_url, :string
  end
end
