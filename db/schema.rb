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

ActiveRecord::Schema.define(version: 20170420010243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string   "username",                            null: false
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "email",                               null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.index ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_administrators_on_username", unique: true, using: :btree
  end

  create_table "application_requests", force: :cascade do |t|
    t.integer  "state",         null: false
    t.date     "authorized_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "attatchments", force: :cascade do |t|
    t.string   "url",                    null: false
    t.string   "category",               null: false
    t.integer  "application_request_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["application_request_id"], name: "index_attatchments_on_application_request_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.text     "justification"
    t.integer  "state",                  null: false
    t.integer  "evaluator_id"
    t.integer  "application_request_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["application_request_id"], name: "index_evaluations_on_application_request_id", using: :btree
    t.index ["evaluator_id"], name: "index_evaluations_on_evaluator_id", using: :btree
  end

  create_table "evaluators", force: :cascade do |t|
    t.string   "username",    null: false
    t.string   "first_name",  null: false
    t.string   "last_name",   null: false
    t.string   "email",       null: false
    t.string   "code",        null: false
    t.integer  "language_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["language_id"], name: "index_evaluators_on_language_id", using: :btree
  end

  create_table "keyword_publications", force: :cascade do |t|
    t.integer  "keyword_id"
    t.integer  "publication_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["keyword_id"], name: "index_keyword_publications_on_keyword_id", using: :btree
    t.index ["publication_id"], name: "index_keyword_publications_on_publication_id", using: :btree
  end

  create_table "keywords", force: :cascade do |t|
    t.string   "keyword"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name",       null: false
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
    t.string   "username",                            null: false
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "email",                               null: false
    t.integer  "department",          default: 1
    t.string   "contact_number"
    t.integer  "gender",              default: 1
    t.boolean  "is_authorized",       default: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.index ["username"], name: "index_professors_on_username", unique: true, using: :btree
  end

  create_table "publications", force: :cascade do |t|
    t.text     "title"
    t.text     "abstract"
    t.integer  "application_request_id"
    t.integer  "theme_id"
    t.integer  "category_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["application_request_id"], name: "index_publications_on_application_request_id", using: :btree
    t.index ["category_id"], name: "index_publications_on_category_id", using: :btree
    t.index ["theme_id"], name: "index_publications_on_theme_id", using: :btree
  end

  create_table "themes", force: :cascade do |t|
    t.string   "theme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attatchments", "application_requests"
  add_foreign_key "evaluations", "application_requests"
  add_foreign_key "evaluations", "evaluators"
  add_foreign_key "evaluators", "languages"
  add_foreign_key "keyword_publications", "keywords"
  add_foreign_key "keyword_publications", "publications"
  add_foreign_key "professor_application_requests", "application_requests"
  add_foreign_key "professor_application_requests", "professors"
  add_foreign_key "professor_publications", "professors"
  add_foreign_key "professor_publications", "publications"
  add_foreign_key "publications", "application_requests"
  add_foreign_key "publications", "categories"
  add_foreign_key "publications", "themes"
end
