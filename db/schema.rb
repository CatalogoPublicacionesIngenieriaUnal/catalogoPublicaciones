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

ActiveRecord::Schema.define(version: 20170329202621) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string   "user",       null: false
    t.string   "name",       null: false
    t.string   "lastname",   null: false
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "application_requests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "state_id"
    t.index ["state_id"], name: "index_application_requests_on_state_id", using: :btree
  end

  create_table "approved_publications", force: :cascade do |t|
    t.string   "resolution"
    t.integer  "stock"
    t.integer  "stock_at_store"
    t.integer  "stock_at_library"
    t.integer  "publication_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["publication_id"], name: "index_approved_publications_on_publication_id", using: :btree
  end

  create_table "attachments", force: :cascade do |t|
    t.string   "url",                    null: false
    t.string   "category",               null: false
    t.integer  "application_request_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["application_request_id"], name: "index_attachments_on_application_request_id", using: :btree
  end

  create_table "evaluations", force: :cascade do |t|
    t.text     "concept"
    t.text     "justification"
    t.date     "assigned_at"
    t.integer  "judge_id"
    t.integer  "state_id"
    t.integer  "application_request_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["application_request_id"], name: "index_evaluations_on_application_request_id", using: :btree
    t.index ["judge_id"], name: "index_evaluations_on_judge_id", using: :btree
    t.index ["state_id"], name: "index_evaluations_on_state_id", using: :btree
  end

  create_table "judges", force: :cascade do |t|
    t.string   "user",        null: false
    t.string   "name",        null: false
    t.string   "lastname",    null: false
    t.string   "password"
    t.string   "email",       null: false
    t.datetime "created_at",  null: false
    t.date     "finish_at"
    t.integer  "telephone",   null: false
    t.integer  "language_id"
    t.datetime "updated_at",  null: false
    t.index ["language_id"], name: "index_judges_on_language_id", using: :btree
  end

  create_table "keywords", force: :cascade do |t|
    t.string   "keyword"
    t.integer  "publication_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["publication_id"], name: "index_keywords_on_publication_id", using: :btree
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professor_application_requests", force: :cascade do |t|
    t.integer  "professor_id"
    t.integer  "application_request_id"
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
    t.string   "user",        null: false
    t.string   "name",        null: false
    t.string   "lastname",    null: false
    t.string   "departament", null: false
    t.string   "email",       null: false
    t.datetime "created_at",  null: false
    t.boolean  "validated"
    t.datetime "updated_at",  null: false
  end

  create_table "publications", force: :cascade do |t|
    t.text     "abstract"
    t.string   "theme"
    t.string   "category"
    t.integer  "application_request_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["application_request_id"], name: "index_publications_on_application_request_id", using: :btree
  end

  create_table "states", force: :cascade do |t|
    t.string   "name",       null: false
    t.boolean  "verifier",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "application_requests", "states"
  add_foreign_key "approved_publications", "publications"
  add_foreign_key "attachments", "application_requests"
  add_foreign_key "evaluations", "application_requests"
  add_foreign_key "evaluations", "judges"
  add_foreign_key "evaluations", "states"
  add_foreign_key "judges", "languages"
  add_foreign_key "keywords", "publications"
  add_foreign_key "professor_application_requests", "application_requests"
  add_foreign_key "professor_application_requests", "professors"
  add_foreign_key "professor_publications", "professors"
  add_foreign_key "professor_publications", "publications"
  add_foreign_key "publications", "application_requests"
end
