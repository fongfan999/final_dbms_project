class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.datetime :start_date
      t.float :price
      t.integer :quantity
      t.integer :departure_id
      t.integer :destination_id

      t.index :departure_id
      t.index :destination_id

      t.timestamps
    end
  end
end
