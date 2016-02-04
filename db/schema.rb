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

ActiveRecord::Schema.define(version: 20160204032035) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activity_blurbs", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "activity_id", null: false
    t.text     "text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "sport"
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "first_user_id",  null: false
    t.integer  "second_user_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "match_id",     null: false
    t.text     "message_text", null: false
    t.integer  "user_id",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "unread"
    t.integer  "recipient_id"
  end

  create_table "swipes", force: :cascade do |t|
    t.integer  "swiper_id",  null: false
    t.integer  "swipee_id",  null: false
    t.boolean  "swiped_yes", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                                                  null: false
    t.string   "last_name",                                                   null: false
    t.integer  "age"
    t.string   "gender"
    t.string   "location"
    t.integer  "zipcode"
    t.decimal  "latitude",               precision: 7, scale: 4
    t.decimal  "longitude",              precision: 7, scale: 4
    t.text     "bio"
    t.string   "profile_picture_url",                                         null: false
    t.string   "access_token"
    t.string   "username"
    t.string   "email",                                          default: "", null: false
    t.string   "encrypted_password"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                  default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
