class CreateConsultas < ActiveRecord::Migration
  def self.up
    create_table :consultas do |t|
      t.datetime :data_hora
      t.boolean :efetuado
      t.references :pessoa
      t.references :convenio
      t.float :valor
      t.references :local

      t.timestamps
    end
  end

  def self.down
    drop_table :consultas
  end
end
