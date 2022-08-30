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

ActiveRecord::Schema[7.0].define(version: 2022_08_30_144751) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "movie_show_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_show_id"], name: "index_bookings_on_movie_show_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "castings", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "artist_id", null: false
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_castings_on_artist_id"
    t.index ["movie_id"], name: "index_castings_on_movie_id"
  end

  create_table "cinemas", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "lat"
    t.float "lng"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "movie_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_comments_on_movie_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "interests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "movie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_interests_on_movie_id"
    t.index ["user_id"], name: "index_interests_on_user_id"
  end

  create_table "movie_shows", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "cinema_id", null: false
    t.time "start_at"
    t.string "language"
    t.string "subtitle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cinema_id"], name: "index_movie_shows_on_cinema_id"
    t.index ["movie_id"], name: "index_movie_shows_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "synopsis"
    t.integer "duration"
    t.string "poster"
    t.string "original_language"
    t.string "country"
    t.string "genre"
    t.integer "imbd_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "release_date"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "movie_shows"
  add_foreign_key "bookings", "users"
  add_foreign_key "castings", "artists"
  add_foreign_key "castings", "movies"
  add_foreign_key "comments", "movies"
  add_foreign_key "comments", "users"
  add_foreign_key "interests", "movies"
  add_foreign_key "interests", "users"
  add_foreign_key "movie_shows", "cinemas"
  add_foreign_key "movie_shows", "movies"
end
