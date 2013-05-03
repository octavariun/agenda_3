class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.string :cpf
      t.string :telefone
      t.string :email
      t.string :endereco
      t.string :numero
      t.string :bairro
      t.string :cep
      t.references :cidade

      t.timestamps
    end
    add_index :pessoas, :cidade_id
  end
end
