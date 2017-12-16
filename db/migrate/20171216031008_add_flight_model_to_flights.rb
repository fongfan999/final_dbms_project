class AddFlightModelToFlights < ActiveRecord::Migration[5.1]
  def change
    add_column :flights, :flight_model, :string
  end
end
