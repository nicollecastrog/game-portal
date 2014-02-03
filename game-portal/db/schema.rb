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

ActiveRecord::Schema.define(:version => 20140203164533) do

  create_table "games", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tictacs", :force => true do |t|
    t.integer  "game_id"
    t.string   "sq0"
    t.string   "sq1"
    t.string   "sq2"
    t.string   "sq3"
    t.string   "sq4"
    t.string   "sq5"
    t.string   "sq6"
    t.string   "sq7"
    t.string   "sq8"
    t.integer  "player1"
    t.integer  "player2"
    t.string   "result"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tictacs", ["game_id"], :name => "index_tictacs_on_game_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "score"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "role"
  end

end
