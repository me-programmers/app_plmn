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

ActiveRecord::Schema.define(:version => 20130824062444) do

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "source"
  end

  create_table "hasil2s", :force => true do |t|
    t.integer  "hsl_echantillon"
    t.string   "hsl_item"
    t.float    "hsl_result"
    t.float    "hsl_batas_bawah"
    t.float    "hsl_batas_atas"
    t.integer  "hsl_posisi_desimal"
    t.string   "hsl_id_pasien"
    t.string   "hsl_lab_item_name"
    t.string   "hsl_lab_satuan"
    t.string   "hsl_lab_item_order"
    t.string   "hsl_lab_nilai_normal"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "hsl_lab_harga"
  end

  create_table "hasil3s", :force => true do |t|
    t.integer  "hsl_echantillon"
    t.string   "hsl_item"
    t.float    "hsl_result"
    t.float    "hsl_batas_bawah"
    t.float    "hsl_batas_atas"
    t.integer  "hsl_posisi_desimal"
    t.string   "hsl_id_pasien"
    t.string   "hsl_lab_item_name"
    t.string   "hsl_lab_satuan"
    t.string   "hsl_lab_item_order"
    t.string   "hsl_lab_nilai_normal"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "hasils", :force => true do |t|
    t.string   "item_pemeriksaan"
    t.float    "hasil_pemeriksaan"
    t.string   "satuan"
    t.integer  "an_echantillon"
    t.float    "normal_pl"
    t.float    "normal_ph"
    t.float    "normal_ll"
    t.float    "normal_lh"
    t.float    "faktor_pengali"
    t.integer  "posisi_desimal"
    t.integer  "pasien_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "hasils", ["pasien_id"], :name => "index_hasils_on_pasien_id"

  create_table "lab2s", :force => true do |t|
    t.string   "lab_item_pentra"
    t.string   "lab_item_report"
    t.string   "lab_satuan"
    t.float    "lab_batas_pl"
    t.float    "lab_batas_ph"
    t.float    "lab_batas_ll"
    t.float    "lab_batas_lh"
    t.string   "lab_nilai_normal"
    t.integer  "lab_posisi_desimal"
    t.integer  "lab_item_order"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "lab_item_harga"
  end

  create_table "pasien2s", :force => true do |t|
    t.string   "id_pasien"
    t.string   "nama_pasien"
    t.string   "pangkat_jabatan"
    t.integer  "jenis_kelamin"
    t.string   "umur"
    t.string   "id_sample"
    t.date     "tanggal"
    t.string   "ruangan"
    t.string   "pemeriksa"
    t.text     "komentar"
    t.integer  "id_echantillon"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "pasien3s", :force => true do |t|
    t.string   "id_pasien"
    t.string   "nama_pasien"
    t.string   "pangkat_jabatan"
    t.integer  "jenis_kelamin"
    t.integer  "umur"
    t.string   "id_sample"
    t.date     "tanggal"
    t.string   "ruangan"
    t.string   "pemeriksa"
    t.text     "komentar"
    t.integer  "id_echantillon"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "pasiens", :force => true do |t|
    t.string   "id_pasien"
    t.string   "nama_pasien"
    t.string   "pangkat_jabatan"
    t.integer  "jenis_kelamin"
    t.string   "id_sample"
    t.date     "tanggal"
    t.string   "ruangan"
    t.string   "pemeriksa"
    t.text     "komentar"
    t.integer  "id_echantillon"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
