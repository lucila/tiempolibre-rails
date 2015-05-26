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

ActiveRecord::Schema.define(version: 20150526000012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "country_translations", force: :cascade do |t|
    t.integer  "country_id", null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "country_translations", ["country_id"], name: "index_country_translations_on_country_id", using: :btree
  add_index "country_translations", ["locale"], name: "index_country_translations_on_locale", using: :btree

  create_table "destination_translations", force: :cascade do |t|
    t.integer  "destination_id", null: false
    t.string   "locale",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "about"
  end

  add_index "destination_translations", ["destination_id"], name: "index_destination_translations_on_destination_id", using: :btree
  add_index "destination_translations", ["locale"], name: "index_destination_translations_on_locale", using: :btree

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
    t.integer  "region_id"
  end

  add_index "destinations", ["region_id"], name: "index_destinations_on_region_id", using: :btree

  create_table "region_translations", force: :cascade do |t|
    t.integer  "region_id",  null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "region_translations", ["locale"], name: "index_region_translations_on_locale", using: :btree
  add_index "region_translations", ["region_id"], name: "index_region_translations_on_region_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "country_id"
  end

  add_index "regions", ["country_id"], name: "index_regions_on_country_id", using: :btree

end
