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

ActiveRecord::Schema.define(version: 20140815023611) do

  create_table "accounts", force: true do |t|
    t.string   "account"
    t.string   "password_digest",   limit: 60
    t.string   "nickname"
    t.integer  "availableFlow"
    t.integer  "availableIntegral"
    t.integer  "errorTime"
    t.datetime "loginTime"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "creditdetails", force: true do |t|
    t.string   "cid"
    t.integer  "credit"
    t.string   "intype"
    t.string   "way"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "integraldetials", force: true do |t|
    t.integer  "integral"
    t.string   "intype",     limit: 10
    t.string   "way"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "userid"
    t.string   "username"
    t.string   "password_digest"
    t.string   "nickname"
    t.integer  "flow"
    t.integer  "credits"
    t.integer  "errorTime"
    t.datetime "loginTime"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
