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

ActiveRecord::Schema.define(version: 2020_05_24_161407) do

  create_table "balls", force: :cascade do |t|
    t.string "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cms_basic_pages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "commentable_id"
    t.string "commentable_type"
    t.text "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "divisions", primary_key: "custom_id", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "custom_league_id"
    t.string "name", limit: 50, null: false
  end

  create_table "drafts", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "player_id"
    t.integer "team_id"
    t.date "date"
    t.integer "round"
    t.integer "pick"
    t.integer "overall"
    t.string "college", limit: 100
    t.text "notes"
  end

  create_table "fans", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name", limit: 100, null: false
  end

  create_table "fans_teams", id: false, force: :cascade do |t|
    t.integer "fan_id"
    t.integer "team_id"
  end

  create_table "field_tests", force: :cascade do |t|
    t.string "string_field"
    t.text "text_field"
    t.integer "integer_field"
    t.float "float_field"
    t.decimal "decimal_field"
    t.datetime "datetime_field"
    t.datetime "timestamp_field"
    t.time "time_field"
    t.date "date_field"
    t.boolean "boolean_field"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "format"
    t.string "restricted_field"
    t.string "protected_field"
    t.string "dragonfly_asset_uid"
    t.string "carrierwave_asset"
    t.string "paperclip_asset_file_name"
    t.string "paperclip_asset_content_type"
    t.bigint "paperclip_asset_file_size"
    t.datetime "paperclip_asset_updated_at"
  end

  create_table "leagues", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name", limit: 50, null: false
  end

  create_table "nested_field_tests", force: :cascade do |t|
    t.string "title"
    t.integer "field_test_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer "team_id"
    t.string "name", limit: 100, null: false
    t.string "position", limit: 50
    t.integer "number", null: false
    t.boolean "retired", default: false
    t.boolean "injured", default: false
    t.date "born_on"
    t.text "notes"
    t.boolean "suspended", default: false
    t.index ["number", "team_id"], name: "index_players_on_number_and_team_id", unique: true
  end

  create_table "rel_tests", force: :cascade do |t|
    t.integer "league_id"
    t.integer "division_id", null: false
    t.integer "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "division_id"
    t.string "name", limit: 50
    t.string "logo_url", limit: 255
    t.string "manager", limit: 100, null: false
    t.string "ballpark", limit: 100
    t.string "mascot", limit: 100
    t.integer "founded"
    t.integer "wins"
    t.integer "losses"
    t.float "win_percentage"
    t.decimal "revenue", precision: 18, scale: 2
    t.string "color"
  end

  create_table "unscoped_pages", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.bigint "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string "foreign_key_name", null: false
    t.integer "foreign_key_id"
    t.string "foreign_type"
    t.index ["foreign_key_name", "foreign_key_id", "foreign_type"], name: "index_version_associations_on_foreign_key"
    t.index ["version_id"], name: "index_version_associations_on_version_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", limit: 8, null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", limit: 1073741823
    t.datetime "created_at"
    t.integer "transaction_id"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
    t.index ["transaction_id"], name: "index_versions_on_transaction_id"
  end

end
