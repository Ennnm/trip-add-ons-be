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

AddOn.create!([{
  name: "Single room upgrade",
  total_spots: 100,
  used_spots: 0,
}, {
  name: "Single room extreme upgrade",
  total_spots: 1,
  used_spots: 1,
}, {
  name: "Visit to cultural house",
  start_time: DateTime.new(2024, 6, 1, 15).to_time.to_i,
  end_time: DateTime.new(2024, 6, 1, 17).to_time.to_i,
  total_spots: 100,
  used_spots: 0,
}, {
  name: "Visit to theatre",
  start_time: DateTime.new(2024, 6, 1, 14).to_time.to_i, # conflicting time entry
  end_time: DateTime.new(2024, 6, 1, 16).to_time.to_i,
  total_spots: 100,
  used_spots: 0,
}, {
  name: "Visit to beer garden",
  start_time: DateTime.new(2024, 6, 1, 18).to_time.to_i,
  end_time: DateTime.new(2024, 6, 1, 20).to_time.to_i,
  total_spots: 100,
  used_spots: 0,
}])

TripAddOn.create!([{
  trip_id: 1,
  add_on_id: 2,
}])
