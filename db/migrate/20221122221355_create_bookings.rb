class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.timestamps
    end
    add_belongs_to :bookings, :flight, null: false, foreign_key: { to_table: :flights }
  end
end
