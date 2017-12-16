class AddFlightToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :flight, :string
  end
end
