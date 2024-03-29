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

ActiveRecord::Schema.define(version: 20150210031809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: true do |t|
    t.integer  "group_id",    null: false
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "groups", force: true do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.integer  "user_id"
  end

  create_table "invites", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "membership_roles", force: true do |t|
    t.integer  "membership_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role",          default: 0
  end

  create_table "memberships", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.integer  "user_id"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "rsvps", force: true do |t|
    t.integer  "user_id",                  null: false
    t.integer  "event_id",                 null: false
    t.integer  "guest_count",  default: 0
    t.integer  "is_attending", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "bio"
    t.string   "city"
    t.string   "state"
    t.string   "phone_number"
    t.string   "avatar_url"
    t.string   "slug"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "events", "groups", name: "events_group_id_fk"

  add_foreign_key "membership_roles", "memberships", name: "membership_roles_membership_id_fk"

  add_foreign_key "rsvps", "events", name: "rsvps_event_id_fk"
  add_foreign_key "rsvps", "users", name: "rsvps_user_id_fk"

end
