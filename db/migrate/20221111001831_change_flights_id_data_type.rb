class ChangeFlightsIdDataType < ActiveRecord::Migration[7.0]
  def change
    change_column :flights, :arrival_id, :integer
    change_column :flights, :departure_id, :integer
  end
end
