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

ActiveRecord::Schema.define(version: 20200923031025) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "photo"
    t.string "title"
    t.string "author_id"
    t.string "description"
    t.boolean "public", null: false, default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_id"
    t.index ["course_id"], name: "index_recipes_on_course_id"
  end

  create_table "recipes_categories", id: false, force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "category_id"
  end

  create_table "recipes_restrictions", id: false, force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "restriction_id"
  end

  create_table "recipes_tags", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "tag_id"
  end

  create_table "restrictions", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "recipe_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", null: false, default: false
  end

end
