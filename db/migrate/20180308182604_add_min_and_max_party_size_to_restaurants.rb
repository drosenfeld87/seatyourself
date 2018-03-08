class AddMinAndMaxPartySizeToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :min_size, :integer
    add_column :restaurants, :max_size, :integer

  end
end
