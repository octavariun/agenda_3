class CreateConsultas < ActiveRecord::Migration
  def change
    create_table :consultas do |t|
      t.datetime :data_hora
      t.boolean :efetuado
      t.references :pessoa
      t.references :convenio
      t.references :local
      t.float :valor
      t.references :atendente

      t.timestamps
    end
    add_index :consultas, :pessoa_id
    add_index :consultas, :convenio_id
    add_index :consultas, :local_id
    add_index :consultas, :atendente_id
  end
end
