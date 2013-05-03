class AddPagaToConsulta < ActiveRecord::Migration
  def change
    add_column :consultas, :paga, :boolean
  end
end
