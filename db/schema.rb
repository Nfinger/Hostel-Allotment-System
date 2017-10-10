# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171008190819) do

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.integer  "role"
  end

  create_table "allote_hostels", force: :cascade do |t|
    t.string   "preference"
    t.string   "hostel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "hostel2"
    t.string   "floor"
    t.datetime "starttime"
    t.datetime "endtime"
  end

  create_table "borders", force: :cascade do |t|
    t.string   "roll_no"
    t.string   "name"
    t.string   "email"
    t.text     "address"
    t.string   "phone_no"
    t.string   "room_no"
    t.integer  "hostel_id"
    t.string   "hostel_type"
    t.integer  "student_result_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.boolean  "alloted",           default: false
    t.boolean  "active",            default: false
    t.boolean  "grouped"
    t.string   "parent_phone_no"
    t.index ["hostel_type", "hostel_id"], name: "index_borders_on_hostel_type_and_hostel_id"
    t.index ["student_result_id"], name: "index_borders_on_student_result_id"
  end

  create_table "choices", force: :cascade do |t|
    t.string   "border_roll_no"
    t.float    "cgpi"
    t.string   "year"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "himadris", force: :cascade do |t|
    t.string   "room_no"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "no_of_rooms", default: 3
    t.string   "floor"
    t.string   "active"
  end

  create_table "himgiris", force: :cascade do |t|
    t.string   "room_no"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "no_of_rooms", default: 3
    t.string   "floor"
    t.string   "active"
  end

  create_table "hostels", force: :cascade do |t|
    t.string   "hostel_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "kis", force: :cascade do |t|
    t.string   "room_no"
    t.string   "floor"
    t.integer  "no_of_rooms"
    t.string   "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "neelkanths", force: :cascade do |t|
    t.string   "room_no"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "no_of_rooms", default: 3
    t.string   "floor"
    t.string   "active"
  end

  create_table "preference1s", force: :cascade do |t|
    t.string   "roll_no"
    t.float    "cgpi"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "alloted",    default: 0
    t.datetime "start"
    t.datetime "endtime"
  end

  create_table "preference2s", force: :cascade do |t|
    t.string   "roll_no"
    t.float    "cgpi"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "alloted",    default: 0
    t.datetime "start"
    t.datetime "endtime"
  end

  create_table "preference3s", force: :cascade do |t|
    t.string   "roll_no"
    t.float    "cgpi"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "alloted",    default: 0
    t.datetime "start"
    t.datetime "endtime"
  end

  create_table "preference4s", force: :cascade do |t|
    t.string   "roll_no"
    t.float    "cgpi"
    t.integer  "alloted",    default: 0
    t.datetime "start"
    t.datetime "endtime"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "preftab1s", force: :cascade do |t|
    t.string   "roll_no"
    t.float    "cgpi"
    t.string   "roomie1"
    t.string   "roomie2"
    t.string   "room1"
    t.string   "room2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "hostel"
    t.string   "room3"
    t.string   "room4"
    t.string   "room5"
  end

  create_table "preftab2s", force: :cascade do |t|
    t.string   "roll_no"
    t.float    "cgpi"
    t.string   "hostel"
    t.string   "roomie1"
    t.string   "roomie2"
    t.string   "room1"
    t.string   "room2"
    t.string   "room3"
    t.string   "room4"
    t.string   "room5"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preftab3s", force: :cascade do |t|
    t.string   "roll_no"
    t.float    "cgpi"
    t.string   "hostel"
    t.string   "roomie1"
    t.string   "roomie2"
    t.string   "room1"
    t.string   "room2"
    t.string   "room3"
    t.string   "room4"
    t.string   "room5"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preftab4s", force: :cascade do |t|
    t.string   "roll_no"
    t.float    "cgpi"
    t.string   "hostel"
    t.string   "roomie1"
    t.string   "roomie2"
    t.string   "room1"
    t.string   "room2"
    t.string   "room3"
    t.string   "room4"
    t.string   "room5"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_choices", force: :cascade do |t|
    t.string   "hostel"
    t.string   "room_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "choice_id"
    t.index ["choice_id"], name: "index_room_choices_on_choice_id"
  end

  create_table "roommates", force: :cascade do |t|
    t.string   "roommate"
    t.integer  "choice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["choice_id"], name: "index_roommates_on_choice_id"
  end

  create_table "student_results", force: :cascade do |t|
    t.string   "roll_no"
    t.float    "sgpi"
    t.float    "cgpi"
    t.string   "semester"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "temphostels", force: :cascade do |t|
    t.string   "room_no"
    t.string   "floor"
    t.string   "no_of_rooms"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "this", force: :cascade do |t|
    t.string   "room_no"
    t.string   "floor"
    t.integer  "no_of_rooms"
    t.string   "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
