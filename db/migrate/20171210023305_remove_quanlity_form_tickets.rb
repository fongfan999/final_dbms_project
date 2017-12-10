class RemoveQuanlityFormTickets < ActiveRecord::Migration[5.1]
  def change
    remove_column :tickets, :quantity
  end
end
