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

ActiveRecord::Schema.define(version: 20141105173719) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.string   "title"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["group_id"], name: "index_comments_on_group_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name"
    t.string   "climbing_level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "place_id"
    t.integer  "creator_id"
    t.integer  "capacity"
  end

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

  create_table "ratings", force: true do |t|
    t.integer  "place_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "ratings", ["place_id"], name: "index_ratings_on_place_id", using: :btree

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
