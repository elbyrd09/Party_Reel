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

ActiveRecord::Schema.define(version: 2020_04_30_063428) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "attendees", force: :cascade do |t|
    t.string "interaction"
    t.boolean "influencer"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_attendees_on_user_id"
  end

  create_table "attendeeshotpreferences", force: :cascade do |t|
    t.bigint "attendee_id"
    t.bigint "shotpreference_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendee_id"], name: "index_attendeeshotpreferences_on_attendee_id"
    t.index ["shotpreference_id"], name: "index_attendeeshotpreferences_on_shotpreference_id"
  end

  create_table "availabilityvalidators", force: :cascade do |t|
    t.string "validate_each"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "availablephotographers", force: :cascade do |t|
    t.string "fully_booked"
    t.bigint "event_id"
    t.bigint "photographer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_availablephotographers_on_event_id"
    t.index ["photographer_id"], name: "index_availablephotographers_on_photographer_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.time "start_time"
    t.time "end_time"
    t.bigint "attendee_id"
    t.bigint "photographer_id"
    t.bigint "event_id"
    t.bigint "package_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.string "checkout_session_id"
    t.integer "amount_cents", default: 0, null: false
    t.index ["attendee_id"], name: "index_bookings_on_attendee_id"
    t.index ["event_id"], name: "index_bookings_on_event_id"
    t.index ["package_id"], name: "index_bookings_on_package_id"
    t.index ["photographer_id"], name: "index_bookings_on_photographer_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.text "event_description"
    t.string "location"
    t.string "type_event"
    t.string "genre"
    t.string "partnership"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "local_img"
    t.string "city"
    t.string "state"
    t.string "country"
    t.integer "latitude"
    t.integer "longitude"
  end

  create_table "packages", force: :cascade do |t|
    t.string "session"
    t.text "description"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "local_img"
    t.string "bullet1"
    t.string "bullet2"
    t.string "bullet3"
  end

  create_table "photographers", force: :cascade do |t|
    t.string "phone_number"
    t.string "camera"
    t.string "lenses"
    t.string "profession"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_photographers_on_user_id"
  end

  create_table "photographerspecialties", force: :cascade do |t|
    t.bigint "specialty_id"
    t.bigint "photographer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photographer_id"], name: "index_photographerspecialties_on_photographer_id"
    t.index ["specialty_id"], name: "index_photographerspecialties_on_specialty_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
  end

  create_table "shotpreferences", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specialties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "location"
    t.string "user_ig_handle"
    t.string "provider"
    t.string "uid"
    t.string "facebook_picture_url"
    t.string "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "attendees", "users"
  add_foreign_key "attendeeshotpreferences", "attendees"
  add_foreign_key "attendeeshotpreferences", "shotpreferences"
  add_foreign_key "availablephotographers", "events"
  add_foreign_key "availablephotographers", "photographers"
  add_foreign_key "bookings", "attendees"
  add_foreign_key "bookings", "events"
  add_foreign_key "bookings", "packages"
  add_foreign_key "bookings", "photographers"
  add_foreign_key "photographers", "users"
  add_foreign_key "photographerspecialties", "photographers"
  add_foreign_key "photographerspecialties", "specialties"
  add_foreign_key "reviews", "bookings"
end
