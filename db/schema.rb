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

ActiveRecord::Schema.define(version: 20161213003431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "post_id"
    t.integer  "user_id"
    t.integer  "sale_trade_want_id"
    t.index ["post_id"], name: "index_photos_on_post_id", using: :btree
    t.index ["sale_trade_want_id"], name: "index_photos_on_sale_trade_want_id", using: :btree
    t.index ["user_id"], name: "index_photos_on_user_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.string   "body"
    t.integer  "replyto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "topic_id"
    t.index ["topic_id"], name: "index_posts_on_topic_id", using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "private_posts", force: :cascade do |t|
    t.string   "body"
    t.integer  "privatereplyto"
    t.string   "emailbuyer"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.integer  "sale_trade_want_id"
    t.index ["sale_trade_want_id"], name: "index_private_posts_on_sale_trade_want_id", using: :btree
    t.index ["user_id"], name: "index_private_posts_on_user_id", using: :btree
  end

  create_table "reply_posts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "post_id"
    t.index ["post_id"], name: "index_reply_posts_on_post_id", using: :btree
  end

  create_table "reply_private_posts", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "private_post_id"
    t.index ["private_post_id"], name: "index_reply_private_posts_on_private_post_id", using: :btree
  end

  create_table "sale_trade_wants", force: :cascade do |t|
    t.string   "type_stw"
    t.string   "title"
    t.string   "description"
    t.boolean  "active"
    t.string   "emailbuyer"
    t.string   "buyer_id"
    t.string   "feedback"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "topic_id"
    t.index ["topic_id"], name: "index_sale_trade_wants_on_topic_id", using: :btree
    t.index ["user_id"], name: "index_sale_trade_wants_on_user_id", using: :btree
  end

  create_table "topics", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "enddate"
    t.boolean  "enable"
    t.string   "owner"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "category_id"
    t.index ["category_id"], name: "index_topics_on_category_id", using: :btree
    t.index ["user_id"], name: "index_topics_on_user_id", using: :btree
  end

  create_table "user_preferences", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.integer  "subscribedtopic"
    t.index ["user_id"], name: "index_user_preferences_on_user_id", using: :btree
  end

  create_table "user_profiles", force: :cascade do |t|
    t.boolean  "enable"
    t.boolean  "connected"
    t.string   "location"
    t.string   "avatar"
    t.string   "rating"
    t.string   "lasttopic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_user_profiles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "username"
    t.string   "password"
    t.string   "timestamp"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_foreign_key "photos", "posts"
  add_foreign_key "photos", "sale_trade_wants"
  add_foreign_key "photos", "users"
  add_foreign_key "posts", "topics"
  add_foreign_key "posts", "users"
  add_foreign_key "private_posts", "sale_trade_wants"
  add_foreign_key "private_posts", "users"
  add_foreign_key "reply_posts", "posts"
  add_foreign_key "reply_private_posts", "private_posts"
  add_foreign_key "sale_trade_wants", "topics"
  add_foreign_key "sale_trade_wants", "users"
  add_foreign_key "topics", "categories"
  add_foreign_key "topics", "users"
  add_foreign_key "user_preferences", "users"
  add_foreign_key "user_profiles", "users"
end
