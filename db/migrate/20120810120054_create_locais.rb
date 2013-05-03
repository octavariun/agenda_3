class CreateLocais < ActiveRecord::Migration
  def change
    create_table :locais do |t|
      t.string :nome
      t.integer :quantidade

      t.timestamps
    end
  end
end
