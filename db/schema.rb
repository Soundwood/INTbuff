# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_09_130059) do

  create_table "ed_pursuits", force: :cascade do |t|
    t.integer "ed_type_id"
    t.string "name"
    t.string "subject"
    t.string "provider"
    t.string "instructor"
    t.datetime "start_date"
    t.integer "duration_d"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["ed_type_id"], name: "index_ed_pursuits_on_ed_type_id"
    t.index ["user_id"], name: "index_ed_pursuits_on_user_id"
  end

  create_table "ed_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "ed_pursuit_id", null: false
    t.string "title"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ed_pursuit_id"], name: "index_notes_on_ed_pursuit_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "ed_pursuits", "ed_types"
  add_foreign_key "ed_pursuits", "users"
  add_foreign_key "notes", "ed_pursuits"
  add_foreign_key "notes", "users"
end
