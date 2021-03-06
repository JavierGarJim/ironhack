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

ActiveRecord::Schema.define(version: 20160219231541) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "associations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "barbecue_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "associations", ["barbecue_id"], name: "index_associations_on_barbecue_id", using: :btree
  add_index "associations", ["user_id"], name: "index_associations_on_user_id", using: :btree

  create_table "barbecue_items", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "barbecue_id"
    t.integer  "item_id"
  end

  add_index "barbecue_items", ["barbecue_id"], name: "index_barbecue_items_on_barbecue_id", using: :btree
  add_index "barbecue_items", ["item_id"], name: "index_barbecue_items_on_item_id", using: :btree

  create_table "barbecues", force: :cascade do |t|
    t.datetime "date"
    t.string   "title"
    t.string   "venue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "barbecue_id"
  end

  add_index "items", ["barbecue_id"], name: "index_items_on_barbecue_id", using: :btree

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "associations", "barbecues"
  add_foreign_key "associations", "users"
  add_foreign_key "barbecue_items", "barbecues"
  add_foreign_key "barbecue_items", "items"
  add_foreign_key "items", "barbecues"
end
