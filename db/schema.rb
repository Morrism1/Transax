# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_06_024957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "group_transactions", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "transaction_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_group_transactions_on_group_id"
    t.index ["transaction_id"], name: "index_group_transactions_on_transaction_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.string "icon"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_groups_on_name"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "name", null: false
    t.integer "author_id"
    t.integer "amount", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_transactions_on_author_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  add_foreign_key "group_transactions", "groups"
  add_foreign_key "group_transactions", "transactions"
  add_foreign_key "groups", "users"
end
