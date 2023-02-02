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

ActiveRecord::Schema[7.0].define(version: 2023_02_01_191049) do
  create_table "cars", force: :cascade do |t|
    t.string "model"
    t.string "make"
    t.string "color"
    t.bigint "mileage"
    t.integer "person_id"
    t.boolean "for_sale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_cars_on_person_id"
  end

  create_table "ownerships", force: :cascade do |t|
    t.integer "car_id", null: false
    t.integer "person_id", null: false
    t.date "date_of_sale"
    t.integer "price"
    t.integer "mileage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_ownerships_on_car_id"
    t.index ["person_id"], name: "index_ownerships_on_person_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cars", "people"
  add_foreign_key "ownerships", "cars"
  add_foreign_key "ownerships", "people"
end
