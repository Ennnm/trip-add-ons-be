class CreateAddOns < ActiveRecord::Migration[7.1]
  def change
    create_table :add_ons do |t|
      t.string :name
      t.timestamp :start_time
      t.timestamp :end_time
      t.integer :total_spots
      t.float :cost

      t.timestamps
    end
  end
end
