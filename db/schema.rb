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

ActiveRecord::Schema.define(version: 20200417060146) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_settings", force: :cascade do |t|
    t.string   "name"
    t.text     "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "divisions", force: :cascade do |t|
    t.string   "name"
    t.integer  "teams_count", default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "number"
  end

  create_table "matches", force: :cascade do |t|
    t.datetime "start_at"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "seasons", ["id"], name: "index_seasons_on_id", unique: true, using: :btree

  create_table "team_match_stats", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "goals"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "team_match_stats", ["team_id"], name: "index_team_match_stats_on_team_id", using: :btree

  create_table "team_season_stats", force: :cascade do |t|
    t.integer  "season_id"
    t.integer  "team_id"
    t.integer  "division_id"
    t.integer  "matches_played", default: 0,   null: false
    t.string   "goals_scored",   default: "0", null: false
    t.integer  "goals_against",  default: 0,   null: false
    t.integer  "points",         default: 0,   null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "team_season_stats", ["season_id"], name: "index_team_season_stats_on_season_id", using: :btree
  add_index "team_season_stats", ["team_id"], name: "index_team_season_stats_on_team_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.integer  "division_id"
    t.string   "name"
    t.integer  "players_count", default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "teams", ["division_id"], name: "index_teams_on_division_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.integer  "team_id"
    t.string   "status"
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "role",                   default: "player"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["id"], name: "index_users_on_id", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["team_id"], name: "index_users_on_team_id", using: :btree

end
