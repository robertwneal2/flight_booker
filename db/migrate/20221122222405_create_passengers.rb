class CreatePassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers do |t|
      t.string :name, null: false
      t.string :email, null: false

      t.timestamps
    end

    create_join_table :passengers, :bookings, table_name: :passenger_bookings do |t|
      t.index :passenger_id
      t.index :booking_id

      t.timestamps
    end
  end
end
