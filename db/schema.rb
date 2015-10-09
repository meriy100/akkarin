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

ActiveRecord::Schema.define(version: 20151009140222) do

  create_table "budgets", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "sub_category_id"
    t.integer  "price"
    t.date     "started_date"
    t.date     "finished_date"
    t.text     "remarks"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "color_id"
    t.integer  "user_id"
    t.integer  "wallet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expense_items", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "sub_category_id"
    t.integer  "price"
    t.text     "remarks"
    t.integer  "wallet_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "salaries", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "price"
    t.text     "remarkds"
    t.integer  "wallets_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "short_ccs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "sub_category_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "short_cps", force: :cascade do |t|
    t.integer  "short_cc_id"
    t.integer  "user_id"
    t.integer  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "user_id"
    t.integer  "wallet_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "transfers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "price"
    t.integer  "form_wallet_id"
    t.integer  "to_wallet_id"
    t.integer  "commission"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "wallets", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
