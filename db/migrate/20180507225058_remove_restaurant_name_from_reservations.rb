class RemoveRestaurantNameFromReservations < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :restaurant_name
  end
end
