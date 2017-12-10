class AddSeatToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :seat, :string
  end
end
