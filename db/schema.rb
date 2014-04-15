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

ActiveRecord::Schema.define(version: 20140415111951) do

  create_table "services", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services_vendors", force: true do |t|
    t.integer  "vendor_id"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "services_vendors", ["service_id"], name: "index_services_vendors_on_service_id"
  add_index "services_vendors", ["vendor_id"], name: "index_services_vendors_on_vendor_id"

  create_table "services_works", force: true do |t|
    t.integer  "service_id"
    t.integer  "work_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "services_works", ["service_id"], name: "index_services_works_on_service_id"
  add_index "services_works", ["work_id"], name: "index_services_works_on_work_id"

  create_table "technologies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "technologies_vendors", force: true do |t|
    t.integer  "vendor_id"
    t.integer  "technology_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "technologies_vendors", ["technology_id"], name: "index_technologies_vendors_on_technology_id"
  add_index "technologies_vendors", ["vendor_id"], name: "index_technologies_vendors_on_vendor_id"

  create_table "testimonials", force: true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vendor_id"
  end

  add_index "testimonials", ["vendor_id"], name: "index_testimonials_on_vendor_id"

  create_table "vendors", force: true do |t|
    t.string   "company"
    t.string   "website"
    t.integer  "no_of_employees"
    t.integer  "year_of_founding"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "display_name"
    t.integer  "phone"
    t.string   "logo"
    t.string   "git_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_featured",      default: false
  end

  create_table "works", force: true do |t|
    t.integer  "vendor_id"
    t.string   "screen_shot"
    t.string   "url"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number_of_views", default: 0
  end

  add_index "works", ["vendor_id"], name: "index_works_on_vendor_id"

end
