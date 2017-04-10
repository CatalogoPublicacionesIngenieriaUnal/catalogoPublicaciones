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

ActiveRecord::Schema.define(version: 20170410050514) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "application_requests", force: :cascade do |t|
    t.integer  "state"
    t.date     "authorized_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "attatchments", force: :cascade do |t|
    t.string   "url"
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.text     "justification"
    t.integer  "state"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "evaluators", force: :cascade do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keywords", force: :cascade do |t|
    t.string   "keyword"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professor_application_requests", force: :cascade do |t|
    t.integer  "professor_id"
    t.integer  "application_request_id"
    t.boolean  "is_holder"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["application_request_id"], name: "index_professor_application_requests_on_application_request_id", using: :btree
    t.index ["professor_id"], name: "index_professor_application_requests_on_professor_id", using: :btree
  end

  create_table "professor_publications", force: :cascade do |t|
    t.integer  "professor_id"
    t.integer  "publication_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["professor_id"], name: "index_professor_publications_on_professor_id", using: :btree
    t.index ["publication_id"], name: "index_professor_publications_on_publication_id", using: :btree
  end

  create_table "professors", force: :cascade do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "department"
    t.integer  "contact_number"
    t.integer  "gender"
    t.boolean  "is_authorized"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "publications", force: :cascade do |t|
    t.text     "title"
    t.text     "abstract"
    t.integer  "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "themes", force: :cascade do |t|
    t.string   "theme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "professor_application_requests", "application_requests"
  add_foreign_key "professor_application_requests", "professors"
  add_foreign_key "professor_publications", "professors"
  add_foreign_key "professor_publications", "publications"
end
