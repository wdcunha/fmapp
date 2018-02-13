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

ActiveRecord::Schema.define(version: 20180213014017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entities", force: :cascade do |t|
    t.string "name"
    t.string "docNumber"
    t.text "address"
    t.text "postaCode"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payee_customer_types", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payee_customers", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.text "postaCode"
    t.string "phone"
    t.string "email"
    t.bigint "payee_customer_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payee_customer_type_id"], name: "index_payee_customers_on_payee_customer_type_id"
  end

  create_table "transac_categs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "transaction_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transaction_type_id"], name: "index_transac_categs_on_transaction_type_id"
  end

  create_table "transaction_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
  end

  create_table "transactions", force: :cascade do |t|
    t.text "details"
    t.date "date"
    t.float "value"
    t.bigint "transaction_type_id"
    t.bigint "entity_id"
    t.bigint "transac_categ_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "payee_customer_id"
    t.index ["entity_id"], name: "index_transactions_on_entity_id"
    t.index ["payee_customer_id"], name: "index_transactions_on_payee_customer_id"
    t.index ["transac_categ_id"], name: "index_transactions_on_transac_categ_id"
    t.index ["transaction_type_id"], name: "index_transactions_on_transaction_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.float "users"
    t.boolean "is_admin", default: false
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "usings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_usings_on_entity_id"
    t.index ["user_id"], name: "index_usings_on_user_id"
  end

  add_foreign_key "payee_customers", "payee_customer_types"
  add_foreign_key "transac_categs", "transaction_types"
  add_foreign_key "transactions", "entities"
  add_foreign_key "transactions", "payee_customers"
  add_foreign_key "transactions", "transac_categs"
  add_foreign_key "transactions", "transaction_types"
  add_foreign_key "usings", "entities"
  add_foreign_key "usings", "users"
end
