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

ActiveRecord::Schema.define(version: 20180321215801) do

  create_table "audits", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean "active"
    t.integer "user_id"
    t.integer "client_id"
    t.integer "questionnaire_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_audits_on_client_id"
    t.index ["questionnaire_id"], name: "index_audits_on_questionnaire_id"
    t.index ["user_id"], name: "index_audits_on_user_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "street_1"
    t.string "street_2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "contact_phone"
    t.string "contact_email"
    t.string "contact_title"
    t.string "contact_first_name"
    t.string "contact_last_name"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questionnaires", force: :cascade do |t|
    t.float "square_footage"
    t.integer "max_occupancy"
    t.integer "num_floors"
    t.text "management_structure"
    t.string "waste_disposal_system"
    t.string "solid_waste_system"
    t.string "waste_management_costs"
    t.string "loading_dock"
    t.string "freight_elevators"
    t.text "location_info"
    t.string "trash_hauler"
    t.string "trash_hauler_contract"
    t.string "trash_hauler_copy"
    t.string "record_of_waste_vol"
    t.string "solid_waste_storage"
    t.string "solid_waste_containers"
    t.text "solid_waste_info"
    t.string "recycling_mandated"
    t.string "recycling_program"
    t.string "recycling_program_stream"
    t.text "recycling_program_info"
    t.string "buy_recycling_policy"
    t.text "buy_recycling_policy_info"
    t.text "discontinued_recycling_info"
    t.string "compost_waste_current"
    t.string "compost_waste_past"
    t.text "compost_program_info"
    t.string "toner"
    t.string "cfls"
    t.string "batteries"
    t.string "peripherals"
    t.string "cell_phones"
    t.string "tvs"
    t.string "corded_equipment"
    t.string "furniture"
    t.string "linens"
    t.string "construction_debris"
    t.string "pallets"
    t.string "zero_waste_policy"
    t.string "leed_certified"
    t.string "recertify_leed"
    t.string "true_zero_waste_audit"
    t.string "prc_waste_audit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
