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

ActiveRecord::Schema.define(version: 20140901192813) do

  create_table "abuses", force: true do |t|
    t.integer  "advert_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "abuses", ["advert_id"], name: "index_abuses_on_advert_id", using: :btree

  create_table "adverts", force: true do |t|
    t.integer  "user_id"
    t.integer  "state_id"
    t.integer  "section_id"
    t.integer  "sport_id"
    t.string   "title"
    t.text     "description"
    t.integer  "price"
    t.boolean  "sell",              default: true
    t.string   "phone"
    t.datetime "renewed_at"
    t.boolean  "retired",           default: false
    t.boolean  "important",         default: false
    t.integer  "viewed_count",      default: 0
    t.integer  "attachments_count", default: 0
    t.integer  "abuses_count",      default: 0
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "adverts", ["section_id"], name: "index_adverts_on_section_id", using: :btree
  add_index "adverts", ["slug"], name: "index_adverts_on_slug", using: :btree
  add_index "adverts", ["sport_id"], name: "index_adverts_on_sport_id", using: :btree
  add_index "adverts", ["state_id"], name: "index_adverts_on_state_id", using: :btree
  add_index "adverts", ["user_id"], name: "index_adverts_on_user_id", using: :btree

  create_table "articles", force: true do |t|
    t.string   "thumbnail_link"
    t.string   "title"
    t.text     "teaser"
    t.text     "body"
    t.boolean  "published",      default: false
    t.boolean  "important",      default: true
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "image_on_top",   default: false
  end

  add_index "articles", ["slug"], name: "index_articles_on_slug", using: :btree

  create_table "attachments", force: true do |t|
    t.integer  "advert_id"
    t.boolean  "main",                 default: false
    t.text     "transloadit_response"
    t.string   "lg_url"
    t.string   "md_url"
    t.string   "sm_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["advert_id"], name: "index_attachments_on_advert_id", using: :btree

  create_table "contacts", force: true do |t|
    t.integer  "user_id"
    t.integer  "advert_id"
    t.string   "email"
    t.text     "message"
    t.boolean  "read",       default: false
    t.boolean  "newsletter", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["advert_id"], name: "index_contacts_on_advert_id", using: :btree
  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id", using: :btree

  create_table "sections", force: true do |t|
    t.string   "name"
    t.string   "search_term"
    t.integer  "adverts_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sports", force: true do |t|
    t.string   "name"
    t.string   "search_term"
    t.integer  "adverts_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: true do |t|
    t.string   "name"
    t.string   "search_term"
    t.integer  "adverts_count",            default: 0
    t.float    "latitude",      limit: 24
    t.float    "longitude",     limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscribers", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "professional",           default: false
    t.string   "name"
    t.integer  "state_id"
    t.string   "address"
    t.string   "phone"
    t.text     "company_description"
    t.string   "slug"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
