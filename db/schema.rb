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

ActiveRecord::Schema.define(version: 20140520201513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.integer  "miles"
    t.integer  "students"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  create_table "classrooms", force: true do |t|
    t.string  "name"
    t.integer "miles"
    t.integer "school_id"
  end

  create_table "schools", force: true do |t|
    t.string  "name"
    t.integer "user_id"
    t.string  "address"
    t.string  "classrooms"
    t.string  "state"
    t.string  "city"
    t.string  "street"
    t.integer "students"
    t.integer "zipcode"
    t.integer "lat"
    t.integer "long"
  end

  create_table "sessions", force: true do |t|
    t.integer  "user_id"
    t.string   "session_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string  "name"
    t.string  "email"
    t.string  "password"
    t.integer "school_id"
  end

end
