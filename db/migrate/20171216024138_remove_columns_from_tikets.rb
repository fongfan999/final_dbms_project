class RemoveColumnsFromTikets < ActiveRecord::Migration[5.1]
  def change
    remove_column :tickets, :flight, :string
    remove_column :tickets, :start_date, :datetime
    remove_column :tickets, :departure_id, :integer
    remove_column :tickets, :destination_id, :integer
  end
end
