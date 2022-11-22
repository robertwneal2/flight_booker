class CreatePassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers do |t|
      t.string :name, null: false
      t.string :email, null: false

      t.timestamps
    end
    add_belongs_to :bookings, :passenger, null: false, foreign_key: { to_table: :passengers }
  end
end
