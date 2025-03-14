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

ActiveRecord::Schema[8.0].define(version: 2025_03_14_181409) do
  create_table "books", force: :cascade do |t|
    t.string "book_name"
    t.integer "publishing_year"
    t.string "language_code"
    t.decimal "book_average_rating"
    t.integer "book_ratings_count"
    t.string "genre"
    t.string "gross_sales"
    t.string "sale_price"
    t.integer "sale_rank"
    t.integer "units_sold"
    t.integer "publisher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publisher_id"], name: "index_books_on_publisher_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "publisher_name"
    t.string "publisher_revenue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "books", "publishers"
end
