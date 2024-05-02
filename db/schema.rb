# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_02_082803) do
  create_table "add_ons", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "total_spots"
    t.integer "used_spots"
    t.float "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trip_add_ons", force: :cascade do |t|
    t.integer "trip_id"
    t.integer "add_on_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["add_on_id"], name: "index_trip_add_ons_on_add_on_id"
    t.index ["trip_id"], name: "index_trip_add_ons_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end