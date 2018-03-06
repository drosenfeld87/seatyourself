class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.string :email
      t.string :restaurant_name
      t.date :date
      t.time :time
      t.integer :number_of_people
      
      t.timestamps
    end
  end
end
