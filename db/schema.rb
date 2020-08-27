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

ActiveRecord::Schema.define(version: 2020_08_27_175748) do

  create_table "appliances", force: :cascade do |t|
    t.string "name"
    t.float "power"
    t.float "standby"
    t.float "usage"
  end

  create_table "device_groups", force: :cascade do |t|
    t.integer "group_id"
    t.integer "device_id"
  end

  create_table "devices", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "name"
    t.float "power"
    t.float "standby"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

end
