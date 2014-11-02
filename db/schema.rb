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

ActiveRecord::Schema.define(version: 20141102160335) do

# Could not dump table "groups" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "groups_users", id: false, force: true do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  create_table "places", force: true do |t|
    t.string   "name"
    t.string   "kind"
    t.string   "location"
    t.string   "picture"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "placeimage_file_name"
    t.string   "placeimage_content_type"
    t.integer  "placeimage_file_size"
    t.datetime "placeimage_updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "climbing_level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "userpic_file_name"
    t.string   "userpic_content_type"
    t.integer  "userpic_file_size"
    t.datetime "userpic_updated_at"
  end

end
