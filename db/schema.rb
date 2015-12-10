# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151210223653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advertising_platforms", force: :cascade do |t|
    t.string   "name",                         null: false
    t.string   "platform_name",                null: false
    t.string   "url",                          null: false
    t.boolean  "active",        default: true, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "banners", force: :cascade do |t|
    t.integer  "advertising_platform_id"
    t.string   "name",                                   null: false
    t.string   "url",                                    null: false
    t.integer  "views_count",             default: 0,    null: false
    t.integer  "max_views_count",         default: 1,    null: false
    t.integer  "clicks_count",            default: 0,    null: false
    t.boolean  "active",                  default: true, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "image"
  end

  add_index "banners", ["advertising_platform_id"], name: "index_banners_on_advertising_platform_id", using: :btree

end
