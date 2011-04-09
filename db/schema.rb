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

ActiveRecord::Schema.define(:version => 20110409004138) do

  create_table "scorecards", :force => true do |t|
    t.integer  "hole1"
    t.integer  "hole2"
    t.integer  "hole3"
    t.integer  "hole4"
    t.integer  "hole5"
    t.integer  "hole6"
    t.integer  "hole7"
    t.integer  "hole8"
    t.integer  "hole9"
    t.integer  "hole10"
    t.integer  "hole11"
    t.integer  "hole12"
    t.integer  "hole13"
    t.integer  "hole14"
    t.integer  "hole15"
    t.integer  "hole16"
    t.integer  "hole17"
    t.integer  "hole18"
    t.integer  "total"
    t.boolean  "pro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
