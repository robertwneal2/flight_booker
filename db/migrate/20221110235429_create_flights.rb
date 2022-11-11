class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.datetime :start, null: false
      t.integer :duration, null: false

      t.timestamps
    end
    add_belongs_to :flights, :arrival, null: false, foreign_key: { to_table: :airports }
    add_belongs_to :flights, :departure, null: false, foreign_key: { to_table: :airports }
  end
end
