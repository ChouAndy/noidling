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

ActiveRecord::Schema.define(version: 20150109065437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_activities", force: :cascade do |t|
    t.string   "name"
    t.string   "subject"
    t.string   "sponsor"
    t.string   "cosponsor"
    t.date     "hold_date"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "site"
    t.text     "achievement"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "admin_counters", force: :cascade do |t|
    t.integer  "category"
    t.integer  "number",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "admin_downloads", force: :cascade do |t|
    t.string   "category"
    t.string   "title"
    t.integer  "download_type"
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
    t.string   "url"
    t.string   "url_file_name"
    t.string   "url_file_content_type"
    t.string   "url_file_size"
    t.string   "url_file_size_unit"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "admin_knowledges", force: :cascade do |t|
    t.string   "question"
    t.text     "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_laws", force: :cascade do |t|
    t.string   "name"
    t.string   "site_url"
    t.string   "word_url"
    t.string   "pdf_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_marquees", force: :cascade do |t|
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_news", force: :cascade do |t|
    t.date     "public_date"
    t.string   "title"
    t.text     "content"
    t.integer  "click",       default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "admin_pics", force: :cascade do |t|
    t.integer  "admin_activity_id"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "admin_pics", ["admin_activity_id"], name: "index_admin_pics_on_admin_activity_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",         null: false
    t.string   "crypted_password", null: false
    t.string   "salt",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "admin_pics", "admin_activities"
end
