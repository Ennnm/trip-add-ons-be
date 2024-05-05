# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Trip.destroy_all
AddOn.destroy_all
TripAddOn.destroy_all

Trip.create!([{
  name: "Prague 7d6n",
}])

trip2 = Trip.create!([{
  name: "Prague 7d6n two",
}])

addOns = AddOn.create!([{
  name: "Single room upgrade",
  total_spots: 100,
  cost: 49,
}, {
  name: "Single room extreme upgrade",
  total_spots: 1,
  cost: 100
}, {
  name: "Visit to cultural house",
  start_time: Time.new(2024, 6, 1, 15),
  end_time: Time.new(2024, 6, 1, 17),
  total_spots: 100,
  cost: 20
}, {
  name: "Visit to theatre",
  start_time: Time.new(2024, 6, 1, 14), # conflicting time entry
  end_time: Time.new(2024, 6, 1, 16),
  total_spots: 100,
  cost: 25
}, {
  name: "Visit to beer garden",
  start_time: Time.new(2024, 6, 1, 18),
  end_time: Time.new(2024, 6, 1, 20),
  total_spots: 100,
  cost: 30
}])

TripAddOn.create!([{
  trip_id: trip2[0].id,
  add_on_id: addOns[1].id,
}])
