# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_07_26_173807) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categorias", force: :cascade do |t|
    t.string "nome"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nome"], name: "index_categorias_on_nome", unique: true
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.string "slug"
    t.string "descricao"
    t.float "preco"
    t.integer "status", default: 1, null: false
    t.bigint "categoria_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categoria_id"], name: "index_produtos_on_categoria_id"
  end

  add_foreign_key "produtos", "categorias"
end
