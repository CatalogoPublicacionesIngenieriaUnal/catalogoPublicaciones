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

ActiveRecord::Schema.define(version: 20170324024005) do

  create_table "administrators", force: :cascade do |t|
    t.string   "user"
    t.string   "name"
    t.string   "lastname"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "application_requests", force: :cascade do |t|
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "approved_publications", force: :cascade do |t|
    t.string   "resolution"
    t.integer  "stock"
    t.integer  "stock_at_store"
    t.integer  "stock_at_library"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "attachments", force: :cascade do |t|
    t.string   "url"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.text     "concept"
    t.text     "justification"
    t.date     "assigned_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "judges", force: :cascade do |t|
    t.string   "user"
    t.string   "name"
    t.string   "lastname"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at", null: false
    t.date     "finish_at"
    t.integer  "telephone"
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professor_application_requests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professor_publications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professors", force: :cascade do |t|
    t.string   "user"
    t.string   "name"
    t.string   "lastname"
    t.string   "departament"
    t.string   "email"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "publications", force: :cascade do |t|
    t.text     "abstract"
    t.string   "theme"
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.boolean  "verifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
