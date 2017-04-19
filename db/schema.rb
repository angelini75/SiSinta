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

ActiveRecord::Schema.define(version: 20161014224551) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "adjuntos", force: :cascade do |t|
    t.integer  "perfil_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "archivo_file_name"
    t.string   "archivo_content_type"
    t.integer  "archivo_file_size"
    t.datetime "archivo_updated_at"
    t.string   "notas"
    t.boolean  "publico",              default: false
    t.integer  "usuario_id"
  end

  add_index "adjuntos", ["perfil_id"], name: "index_adjuntos_on_perfil_id", using: :btree
  add_index "adjuntos", ["usuario_id"], name: "index_adjuntos_on_usuario_id", using: :btree

  create_table "analiticos", force: :cascade do |t|
    t.integer  "registro"
    t.decimal  "humedad",             precision: 5,  scale: 2
    t.decimal  "s"
    t.decimal  "t"
    t.decimal  "ph_pasta"
    t.decimal  "ph_h2o"
    t.decimal  "ph_kcl"
    t.decimal  "resistencia_pasta"
    t.decimal  "base_ca"
    t.decimal  "base_mg"
    t.decimal  "base_k"
    t.decimal  "base_na"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "horizonte_id"
    t.decimal  "arcilla",             precision: 5,  scale: 2
    t.decimal  "carbono_organico_c",  precision: 5,  scale: 2
    t.decimal  "carbono_organico_n",  precision: 6,  scale: 3
    t.decimal  "limo_2_20",           precision: 5,  scale: 2
    t.decimal  "limo_2_50",           precision: 5,  scale: 2
    t.decimal  "arena_muy_fina",      precision: 5,  scale: 2
    t.decimal  "arena_fina",          precision: 5,  scale: 2
    t.decimal  "arena_media",         precision: 5,  scale: 2
    t.decimal  "arena_gruesa",        precision: 5,  scale: 2
    t.decimal  "arena_muy_gruesa",    precision: 5,  scale: 2
    t.decimal  "ca_co3",              precision: 5,  scale: 2
    t.decimal  "agua_15_atm",         precision: 5,  scale: 2
    t.decimal  "agua_util",           precision: 5,  scale: 2
    t.decimal  "conductividad"
    t.decimal  "h"
    t.decimal  "saturacion_t",        precision: 5,  scale: 2
    t.decimal  "saturacion_s_h",      precision: 5,  scale: 2
    t.decimal  "densidad_aparente"
    t.string   "profundidad_muestra"
    t.decimal  "agua_3_atm",          precision: 5,  scale: 2
    t.decimal  "carbono_organico_cn", precision: 20, scale: 1
    t.decimal  "base_al"
    t.decimal  "p_ppm",               precision: 4,  scale: 1
    t.decimal  "arena_total",         precision: 5,  scale: 2
    t.decimal  "gravas",              precision: 5,  scale: 2
  end

  add_index "analiticos", ["horizonte_id"], name: "index_analiticos_on_horizonte_id", unique: true, using: :btree

  create_table "busquedas", force: :cascade do |t|
    t.text     "consulta"
    t.integer  "usuario_id"
    t.string   "nombre"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "publico",    default: false
  end

  add_index "busquedas", ["usuario_id"], name: "index_busquedas_on_usuario_id", using: :btree

  create_table "capacidades", force: :cascade do |t|
    t.integer "perfil_id"
    t.integer "clase_id"
    t.text    "subclase_ids"
  end

  add_index "capacidades", ["perfil_id"], name: "index_capacidades_on_perfil_id", unique: true, using: :btree

  create_table "colores", force: :cascade do |t|
    t.string "hvc", null: false
    t.string "rgb"
  end

  add_index "colores", ["hvc"], name: "index_colores_on_hvc", unique: true, using: :btree
  add_index "colores", ["rgb"], name: "index_colores_on_rgb", using: :btree

  create_table "consistencias", force: :cascade do |t|
    t.integer  "horizonte_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "en_seco_id"
    t.integer  "en_humedo_id"
    t.integer  "adhesividad_id"
    t.integer  "plasticidad_id"
  end

  add_index "consistencias", ["horizonte_id"], name: "index_consistencias_on_horizonte_id", unique: true, using: :btree

  create_table "equipos", force: :cascade do |t|
    t.string   "nombre",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "usuario_id"
  end

  add_index "equipos", ["nombre"], name: "index_equipos_on_nombre", unique: true, using: :btree
  add_index "equipos", ["usuario_id"], name: "index_equipos_on_usuario_id", using: :btree

  create_table "equipos_usuarios", id: false, force: :cascade do |t|
    t.integer "equipo_id"
    t.integer "usuario_id"
  end

  add_index "equipos_usuarios", ["usuario_id", "equipo_id"], name: "index_equipos_usuarios_on_usuario_id_and_equipo_id", using: :btree

  create_table "erosiones", force: :cascade do |t|
    t.integer "subclase_id"
    t.integer "clase_id"
    t.integer "perfil_id"
  end

  add_index "erosiones", ["perfil_id"], name: "index_erosiones_on_perfil_id", unique: true, using: :btree

  create_table "estructuras", force: :cascade do |t|
    t.integer  "horizonte_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "tipo_id"
    t.integer  "clase_id"
    t.integer  "grado_id"
  end

  add_index "estructuras", ["horizonte_id"], name: "index_estructuras_on_horizonte_id", unique: true, using: :btree

  create_table "fases", force: :cascade do |t|
    t.string "codigo", limit: 2
    t.string "nombre"
  end

  add_index "fases", ["nombre"], name: "index_fases_on_nombre", unique: true, using: :btree

  create_table "fichas", force: :cascade do |t|
    t.string   "nombre",                        null: false
    t.string   "identificador",                 null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "default",       default: false
  end

  add_index "fichas", ["identificador"], name: "index_fichas_on_identificador", unique: true, using: :btree

  create_table "grupos", force: :cascade do |t|
    t.string "codigo"
    t.string "descripcion"
  end

  add_index "grupos", ["descripcion"], name: "index_grupos_on_descripcion", unique: true, using: :btree

  create_table "horizontes", force: :cascade do |t|
    t.integer  "profundidad_superior"
    t.float    "ph"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "perfil_id"
    t.string   "humedad"
    t.string   "raices"
    t.string   "formaciones_especiales"
    t.string   "moteados"
    t.string   "barnices"
    t.string   "concreciones"
    t.string   "co3"
    t.string   "tipo"
    t.integer  "color_seco_id"
    t.integer  "color_humedo_id"
    t.integer  "profundidad_inferior"
    t.integer  "textura_id"
  end

  add_index "horizontes", ["perfil_id"], name: "index_horizontes_on_perfil_id", using: :btree

  create_table "humedades", force: :cascade do |t|
    t.integer "clase_id"
    t.integer "perfil_id"
    t.text    "subclase_ids"
  end

  add_index "humedades", ["perfil_id"], name: "index_humedades_on_perfil_id", unique: true, using: :btree

  create_table "ign_provincias", primary_key: "gid", force: :cascade do |t|
    t.string    "objeto", limit: 50
    t.string    "fna",    limit: 150
    t.string    "gna",    limit: 50
    t.string    "nam",    limit: 100
    t.string    "sag",    limit: 50
    t.geography "geog",   limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true, :geographic=>true}
  end

  add_index "ign_provincias", ["geog"], name: "ign_provincias_geog_idx", using: :gist

  create_table "limites", force: :cascade do |t|
    t.integer  "horizonte_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "tipo_id"
    t.integer  "forma_id"
  end

  add_index "limites", ["horizonte_id"], name: "index_limites_on_horizonte_id", unique: true, using: :btree

  create_table "paisajes", force: :cascade do |t|
    t.string   "tipo"
    t.string   "forma"
    t.string   "simbolo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "perfil_id"
  end

  add_index "paisajes", ["perfil_id"], name: "index_paisajes_on_perfil_id", unique: true, using: :btree

  create_table "pedregosidades", force: :cascade do |t|
    t.integer "subclase_id"
    t.integer "clase_id"
    t.integer "perfil_id"
  end

  add_index "pedregosidades", ["perfil_id"], name: "index_pedregosidades_on_perfil_id", unique: true, using: :btree

  create_table "perfiles", force: :cascade do |t|
    t.string   "numero"
    t.integer  "drenaje_id"
    t.float    "profundidad_napa"
    t.decimal  "cobertura_vegetal"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "material_original"
    t.integer  "fase_id"
    t.boolean  "modal",                 default: false
    t.date     "fecha",                                 null: false
    t.boolean  "publico",               default: false
    t.integer  "usuario_id"
    t.integer  "relieve_id"
    t.integer  "posicion_id"
    t.integer  "pendiente_id"
    t.integer  "escurrimiento_id"
    t.integer  "permeabilidad_id"
    t.integer  "anegamiento_id"
    t.integer  "grupo_id"
    t.integer  "sal_id"
    t.integer  "uso_de_la_tierra_id"
    t.string   "vegetacion_o_cultivos"
    t.integer  "serie_id"
    t.text     "observaciones"
  end

  add_index "perfiles", ["serie_id"], name: "index_perfiles_on_serie_id", using: :btree
  add_index "perfiles", ["usuario_id"], name: "index_perfiles_on_usuario_id", using: :btree

  create_table "perfiles_proyectos", id: false, force: :cascade do |t|
    t.integer "proyecto_id"
    t.integer "perfil_id"
  end

  add_index "perfiles_proyectos", ["proyecto_id", "perfil_id"], name: "index_perfiles_proyectos_on_proyecto_id_and_perfil_id", using: :btree

  create_table "proyectos", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.text     "cita"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "usuario_id"
  end

  add_index "proyectos", ["nombre"], name: "index_proyectos_on_nombre", unique: true, using: :btree

  create_table "roles", force: :cascade do |t|
    t.string  "name"
    t.integer "resource_id"
    t.string  "resource_type"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "series", force: :cascade do |t|
    t.string   "nombre"
    t.string   "simbolo"
    t.text     "descripcion"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "cantidad_de_perfiles", default: 0, null: false
    t.integer  "usuario_id"
    t.integer  "provincia_id"
  end

  add_index "series", ["provincia_id"], name: "index_series_on_provincia_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "ubicaciones", force: :cascade do |t|
    t.geometry "coordenadas", limit: {:srid=>4326, :type=>"point"}
    t.string   "descripcion"
    t.integer  "perfil_id"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "recorrido"
    t.string   "mosaico"
    t.integer  "aerofoto"
  end

  add_index "ubicaciones", ["coordenadas"], name: "index_ubicaciones_on_coordenadas", using: :gist
  add_index "ubicaciones", ["perfil_id"], name: "index_ubicaciones_on_perfil_id", unique: true, using: :btree

  create_table "usuarios", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.text     "config"
    t.integer  "ficha_id",               default: 1
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["ficha_id"], name: "index_usuarios_on_ficha_id", using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

  create_table "usuarios_roles", id: false, force: :cascade do |t|
    t.integer "usuario_id"
    t.integer "rol_id"
  end

  add_index "usuarios_roles", ["usuario_id", "rol_id"], name: "index_usuarios_roles_on_usuario_id_and_rol_id", using: :btree

end
