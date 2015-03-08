# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150308213647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "destinations", force: :cascade do |t|
    t.string   "name"
    t.text     "about"
    t.integer  "fall_max"
    t.integer  "fall_min"
    t.integer  "winter_max"
    t.integer  "winter_min"
    t.integer  "spring_max"
    t.integer  "spring_min"
    t.integer  "summer_max"
    t.integer  "summer_min"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "about_br"
    t.text     "about_en"
    t.integer  "region_id"
  end

  add_index "destinations", ["region_id"], name: "index_destinations_on_region_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "country_id"
  end

  add_index "regions", ["country_id"], name: "index_regions_on_country_id", using: :btree

end
