class CreateAtendentes < ActiveRecord::Migration
  def change
    create_table :atendentes do |t|
      t.string :nome
      t.references :usuario
      t.references :cargo

      t.timestamps
    end
    add_index :atendentes, :usuario_id
    add_index :atendentes, :cargo_id
  end
end
