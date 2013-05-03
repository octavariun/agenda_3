class ConsultasJsonController < ApplicationController
active_scaffold :consulta do |conf|
    conf.columns = [
      :data_hora
    ]
        conf.list.columns = [:data_hora]

  end

  def conditions_for_collection
    ["atendente_id = ?", params[:atendente_id]]
  end

  def list
    params[:atendente_id] = Atendente.find(:first,:conditions => ["lower(nome) = ?", params[:atendente].downcase]).id
    super
  end
end