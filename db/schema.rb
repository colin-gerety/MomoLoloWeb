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

ActiveRecord::Schema.define(version: 2018_10_19_215520) do

  create_table "admins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.boolean "approved", default: false, null: false
    t.string "name", default: "", null: false
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
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "art_pieces", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "media"
    t.float "price"
    t.boolean "can_display", default: true
    t.boolean "needs_label", default: true
    t.boolean "currently_hanging", default: true
    t.integer "momo_percent", default: 30
    t.integer "artist_percent", default: 70
    t.integer "other_percent", default: 0
    t.text "note"
    t.string "image"
    t.bigint "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "size"
    t.index ["artist_id"], name: "index_art_pieces_on_artist_id"
  end

  create_table "artists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "web_site"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "instagram"
  end

  create_table "barista_photos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image"
    t.string "title"
    t.string "note"
    t.boolean "can_display", default: true
    t.bigint "barista_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "primary_photo"
    t.index ["barista_id"], name: "index_barista_photos_on_barista_id"
  end

  create_table "baristas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first"
    t.string "last"
    t.boolean "currently_working"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tag_line"
  end

  create_table "event_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "event_start"
    t.datetime "event_end"
    t.string "title"
    t.text "description"
    t.bigint "event_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "recurrent"
    t.string "recurrence_description"
    t.integer "recurrence_days"
    t.boolean "active", default: true
    t.index ["active"], name: "index_events_on_active"
    t.index ["event_image_id"], name: "index_events_on_event_image_id"
  end

  create_table "place_photos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image"
    t.string "title"
    t.string "note"
    t.boolean "can_display", default: true
    t.bigint "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_place_photos_on_place_id"
  end

  create_table "places", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "street_address"
    t.string "city_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "author"
    t.text "quote_html"
    t.string "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "art_pieces", "artists"
  add_foreign_key "barista_photos", "baristas"
  add_foreign_key "events", "event_images"
  add_foreign_key "place_photos", "places"
end
