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

ActiveRecord::Schema.define(version: 20171009223456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "activities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "event_id"
    t.string   "location"
    t.boolean  "public",              default: false
    t.integer  "latitude"
    t.integer  "longitude"
    t.datetime "happening_at"
    t.string   "happening_at_string"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "happening_at"
    t.string   "location"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
    t.string   "happening_at_string"
  end

  create_table "invitations", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "activity_id"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.uuid     "uuid",        default: -> { "uuid_generate_v4()" }
    t.boolean  "declined",    default: false
    t.text     "message"
    t.string   "user_email"
  end

  create_table "invitations_users", force: :cascade do |t|
    t.integer "invitation_id"
    t.integer "user_id"
    t.index ["invitation_id"], name: "index_invitations_users_on_invitation_id", using: :btree
    t.index ["user_id"], name: "index_invitations_users_on_user_id", using: :btree
  end

  create_table "pending_invitations", force: :cascade do |t|
    t.string   "user_email"
    t.integer  "invitation_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
