class CreateLocais < ActiveRecord::Migration
  def self.up
    create_table :locais do |t|
      t.string :nome
      t.integer :quantidade

      t.timestamps
    end
  end

  def self.down
    drop_table :locais
  end
end
