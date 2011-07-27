class CreatePessoas < ActiveRecord::Migration
  def self.up
    create_table :pessoas do |t|
      t.string :nome
      t.string :cpf
      t.string :telefone
      t.string :email
      t.string :endereco
      t.integer :numero
      t.string :bairro
      t.string :cep
      t.references :cidade

      t.timestamps
    end
  end

  def self.down
    drop_table :pessoas
  end
end
