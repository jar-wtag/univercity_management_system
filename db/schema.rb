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

ActiveRecord::Schema.define(version: 20180405044119) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.integer  "department_id"
    t.string   "name",          limit: 60
    t.integer  "course_code"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "courses", ["department_id"], name: "index_courses_on_department_id", using: :btree

  create_table "departments", force: :cascade do |t|
    t.string   "name",       limit: 50
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "credit"
  end

  create_table "sections", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "teacher_id"
    t.integer  "semester_id"
    t.integer  "section_no"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "sections", ["course_id", "teacher_id", "semester_id"], name: "index_sections_on_course_id_and_teacher_id_and_semester_id", using: :btree

  create_table "semesters", force: :cascade do |t|
    t.string   "name",              limit: 50
    t.integer  "duration_in_month"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "student_profiles", force: :cascade do |t|
    t.integer  "section_id"
    t.integer  "student_id"
    t.integer  "year"
    t.integer  "result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_profiles", ["section_id", "student_id"], name: "index_student_profiles_on_section_id_and_student_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.integer  "department_id"
    t.string   "name",          limit: 50
    t.integer  "age"
    t.integer  "roll"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "students", ["department_id"], name: "index_students_on_department_id", using: :btree

  create_table "teachers", force: :cascade do |t|
    t.integer  "department_id"
    t.string   "name",          limit: 50
    t.string   "designation",   limit: 70
    t.integer  "age"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "teachers", ["department_id"], name: "index_teachers_on_department_id", using: :btree

end
