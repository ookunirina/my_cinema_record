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

ActiveRecord::Schema[7.0].define(version: 2023_10_31_171736) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "movierecord_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movierecord_id"], name: "index_likes_on_movierecord_id"
    t.index ["user_id", "movierecord_id"], name: "index_likes_on_user_id_and_movierecord_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "movierecord_tags", force: :cascade do |t|
    t.bigint "movierecord_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movierecord_id", "tag_id"], name: "index_movierecord_tags_on_movierecord_id_and_tag_id", unique: true
    t.index ["movierecord_id"], name: "index_movierecord_tags_on_movierecord_id"
    t.index ["tag_id"], name: "index_movierecord_tags_on_tag_id"
  end

  create_table "movierecords", force: :cascade do |t|
    t.string "title", null: false
    t.string "image_url"
    t.string "viewing_style", null: false
    t.integer "star"
    t.text "review", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_movierecords_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "start_time"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "job_id"
    t.integer "reminder_time"
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "avatar"
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  add_foreign_key "likes", "movierecords"
  add_foreign_key "likes", "users"
  add_foreign_key "movierecord_tags", "movierecords"
  add_foreign_key "movierecord_tags", "tags"
  add_foreign_key "movierecords", "users"
  add_foreign_key "schedules", "users"
end
