class AddOwnerToTickets < ActiveRecord::Migration[5.1]
  def change
    add_reference :tickets, :owner
    add_foreign_key :tickets, :users, column: :owner_id
  end
end
