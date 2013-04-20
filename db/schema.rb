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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130419202546) do

  create_table "documents", :force => true do |t|
    t.string   "file_name"
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "expertises", :force => true do |t|
    t.string   "text"
    t.text     "user_ids"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "expertises_users", :id => false, :force => true do |t|
    t.integer "expertise_id"
    t.integer "user_id"
  end

  create_table "group_messages", :force => true do |t|
    t.string   "message"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "institutions", :force => true do |t|
    t.string   "text"
    t.text     "user_ids"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "institutions_users", :id => false, :force => true do |t|
    t.integer "institution_id"
    t.integer "user_id"
  end

  create_table "interests", :force => true do |t|
    t.string   "text"
    t.text     "user_ids"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "interests_users", :id => false, :force => true do |t|
    t.integer "interest_id"
    t.integer "user_id"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "group_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "project_id"
    t.date     "deadline"
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "bio"
    t.string   "city"
    t.string   "state"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "tmp_password_hash"
    t.text     "interests"
    t.text     "expertises"
    t.text     "institutions"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

end
