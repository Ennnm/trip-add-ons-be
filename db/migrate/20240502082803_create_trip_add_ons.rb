class CreateTripAddOns < ActiveRecord::Migration[7.1]
  def change
    create_table :trip_add_ons do |t|
      t.belongs_to :trip
      t.belongs_to :add_on
      t.timestamps
    end
  end
end
