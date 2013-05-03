class AddHoraConsultaToConsulta < ActiveRecord::Migration
  def change
    add_column :consultas, :hora_consulta, :string
  end
end
