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

ActiveRecord::Schema.define(version: 20170108064516) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budget_categories", force: :cascade do |t|
    t.string   "Name"
    t.boolean  "IsDebit",    default: true, null: false
    t.integer  "sort"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "budget_items", force: :cascade do |t|
    t.float    "amount"
    t.integer  "DueDate",                           null: false
    t.date     "StartDate",                         null: false
    t.date     "EndDate"
    t.integer  "BudgetCategory_id"
    t.boolean  "IsReocurring",      default: false, null: false
    t.boolean  "IsCollection",      default: false, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["BudgetCategory_id"], name: "index_budget_items_on_BudgetCategory_id", using: :btree
  end

  create_table "budgets", force: :cascade do |t|
    t.string   "Title"
    t.float    "StartingBalance"
    t.float    "CurrentBalance"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "budgets_budget_items", id: false, force: :cascade do |t|
    t.integer "budget_id"
    t.integer "BudgetItem_id"
    t.index ["budget_id", "BudgetItem_id"], name: "index_budgets_budget_items_on_budget_id_and_BudgetItem_id", using: :btree
  end

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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
