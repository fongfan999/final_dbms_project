class AddIndexToTickets < ActiveRecord::Migration[5.1]
  def change
    add_index :tickets, [:flight, :seat, :start_date], unique: true
  end
end
