class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.datetime :start_time
      t.integer :departure_id
      t.integer :destination_id
      t.integer :quantity

      t.index :departure_id
      t.index :destination_id

      t.timestamps
    end
  end
end
