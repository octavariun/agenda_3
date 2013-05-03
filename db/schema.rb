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

ActiveRecord::Schema.define(:version => 20130316171614) do

  create_table "atendentes", :force => true do |t|
    t.string   "nome"
    t.integer  "usuario_id"
    t.integer  "cargo_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "atendentes", ["cargo_id"], :name => "index_atendentes_on_cargo_id"
  add_index "atendentes", ["usuario_id"], :name => "index_atendentes_on_usuario_id"

  create_table "cargos", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cidades", :force => true do |t|
    t.string   "nome"
    t.integer  "estado_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cidades", ["estado_id"], :name => "index_cidades_on_estado_id"

  create_table "consultas", :force => true do |t|
    t.datetime "data_hora"
    t.boolean  "efetuado"
    t.integer  "pessoa_id"
    t.integer  "convenio_id"
    t.integer  "local_id"
    t.float    "valor"
    t.integer  "atendente_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.boolean  "paga"
    t.date     "data_consulta"
    t.string   "hora_consulta"
  end

  add_index "consultas", ["atendente_id"], :name => "index_consultas_on_atendente_id"
  add_index "consultas", ["convenio_id"], :name => "index_consultas_on_convenio_id"
  add_index "consultas", ["local_id"], :name => "index_consultas_on_local_id"
  add_index "consultas", ["pessoa_id"], :name => "index_consultas_on_pessoa_id"

  create_table "convenios", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "estados", :force => true do |t|
    t.string   "nome"
    t.string   "sigla"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locais", :force => true do |t|
    t.string   "nome"
    t.integer  "quantidade"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pessoas", :force => true do |t|
    t.string   "nome"
    t.string   "cpf"
    t.string   "telefone"
    t.string   "email"
    t.string   "endereco"
    t.string   "numero"
    t.string   "bairro"
    t.string   "cep"
    t.integer  "cidade_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pessoas", ["cidade_id"], :name => "index_pessoas_on_cidade_id"

  create_table "usuarios", :force => true do |t|
    t.string   "login",                  :default => "", :null => false
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
  end

  add_index "usuarios", ["login"], :name => "index_usuarios_on_login", :unique => true
  add_index "usuarios", ["reset_password_token"], :name => "index_usuarios_on_reset_password_token", :unique => true

end
