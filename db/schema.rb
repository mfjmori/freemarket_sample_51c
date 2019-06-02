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

ActiveRecord::Schema.define(version: 2019_06_02_112003) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "post_code", null: false
    t.string "prefecture", null: false
    t.string "municipality", null: false
    t.string "house_number", null: false
    t.integer "phone_number"
    t.string "building_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buy_orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "saler_id", null: false
    t.bigint "buyer_id", null: false
    t.bigint "item_id", null: false
    t.boolean "receive_completed", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_buy_orders_on_buyer_id"
    t.index ["item_id"], name: "index_buy_orders_on_item_id"
    t.index ["saler_id"], name: "index_buy_orders_on_saler_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "parent_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "user_id", null: false
    t.text "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_comments_on_item_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.string "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_images_on_item_id"
  end

  create_table "installs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_installs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_installs_on_reset_password_token", unique: true
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.bigint "buyer_id"
    t.bigint "saler_id"
    t.string "brand"
    t.bigint "categories_id", null: false
    t.string "size"
    t.integer "price", null: false
    t.integer "postage", null: false
    t.integer "shipping_method", null: false
    t.string "region", null: false
    t.integer "shipping_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "condition", null: false
    t.index ["buyer_id"], name: "index_items_on_buyer_id"
    t.index ["categories_id"], name: "index_items_on_categories_id"
    t.index ["saler_id"], name: "index_items_on_saler_id"
  end

  create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_likes_on_item_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "buy_order_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buy_order_id"], name: "index_messages_on_buy_order_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.text "self_introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "rate", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_reviews_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname", null: false
    t.integer "point", default: 0, null: false
    t.integer "sum_sales", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "buy_orders", "items"
  add_foreign_key "comments", "items"
  add_foreign_key "comments", "users"
  add_foreign_key "images", "items"
  add_foreign_key "items", "categories", column: "categories_id"
  add_foreign_key "likes", "items"
  add_foreign_key "likes", "users"
  add_foreign_key "messages", "buy_orders"
  add_foreign_key "messages", "users"
  add_foreign_key "user_reviews", "users"
end
