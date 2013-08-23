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

ActiveRecord::Schema.define(version: 20130821104756) do

  create_table "assignment_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignments", force: true do |t|
    t.string   "name"
    t.integer  "total"
    t.integer  "section_id"
    t.integer  "assignment_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignments", ["assignment_type_id"], name: "index_assignments_on_assignment_type_id"
  add_index "assignments", ["section_id"], name: "index_assignments_on_section_id"

  create_table "courses", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["department_id"], name: "index_courses_on_department_id"

  create_table "departments", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enrollments", force: true do |t|
    t.integer  "role_id"
    t.integer  "section_id"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "enrollments", ["profile_id"], name: "index_enrollments_on_profile_id"
  add_index "enrollments", ["role_id"], name: "index_enrollments_on_role_id"
  add_index "enrollments", ["section_id"], name: "index_enrollments_on_section_id"

  create_table "grades", force: true do |t|
    t.integer  "value"
    t.integer  "assignment_id"
    t.integer  "enrollment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grades", ["assignment_id"], name: "index_grades_on_assignment_id"
  add_index "grades", ["enrollment_id"], name: "index_grades_on_enrollment_id"

  create_table "profiles", force: true do |t|
    t.string   "display_name"
    t.string   "last_name"
    t.string   "first_name"
    t.date     "dob"
    t.string   "streetaddress"
    t.string   "state"
    t.string   "zipcode"
    t.string   "city"
    t.string   "gender"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.string   "name"
    t.integer  "course_id"
    t.integer  "term_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["course_id"], name: "index_sections_on_course_id"
  add_index "sections", ["term_id"], name: "index_sections_on_term_id"

  create_table "terms", force: true do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "login"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
