class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :restaurant_name
      t.integer :hours_open
      t.integer :hours_closed
      t.integer :capacity
      t.string :url
      t.timestamps
    end
  end
end
