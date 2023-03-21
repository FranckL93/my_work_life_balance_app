# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_21_142956) do
  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.text "descripton"
    t.integer "duration"
    t.integer "goal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goal_id"], name: "index_activities_on_goal_id"
  end

  create_table "communities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_communities_on_user_id"
  end

  create_table "community_memberships", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "community_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_community_memberships_on_community_id"
    t.index ["user_id"], name: "index_community_memberships_on_user_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "deadline"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "reminders", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "date"
    t.time "time"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reminders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "activities", "goals"
  add_foreign_key "communities", "users"
  add_foreign_key "community_memberships", "communities"
  add_foreign_key "community_memberships", "users"
  add_foreign_key "goals", "users"
  add_foreign_key "reminders", "users"
end
