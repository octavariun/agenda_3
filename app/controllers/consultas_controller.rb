class ConsultasController < ApplicationController

  active_scaffold :consulta do |config|
    config.columns = [
      :data_hora, :pessoa, :local, :convenio, :valor, :efetuado
    ]
    config.columns[:pessoa].form_ui = :select
    config.columns[:local].form_ui = :select
    config.columns[:local].clear_link
    config.columns[:convenio].form_ui = :select
    config.columns[:efetuado].form_ui = :checkbox
    config.columns[:efetuado].inplace_edit = true
    config.columns[:data_hora].form_ui = :calendar_date_select
    config.list.sorting = [{ :data_hora => :asc}, {:pessoa_id => :asc }]

#    alterar propriedades html do campo sem precisar sobreescrever
#    config.columns[:local].options = {:size => 15}
#    ver validacao generica do application.js ouvidoria, e usar para mascara como no controller de
#    resposta do chamado

  end
  #
  #  def conditions_for_collection
  #    ["data_hora::date = ?",Date.today]
  #  end
  
  def gravar_efetuado
    consulta = Consulta.find(params[:consulta_id])
    consulta.efetuado = params[:efetuado]
    consulta.save
    render :nothing => true
  end
 
  #  def alterar_dia
  #    @consulta = Consulta.new if @consulta.nil?
  #    @consultas = Consulta.all(:conditions => ["data_hora::date = ?", params[:data].to_date],:order => :data_hora)
  #    @data = params[:data].to_date
  #    render :action => "index"
  #  end
  #
  #  def marcar_consulta
  #    @consulta = Consulta.new
  #    @consulta.pessoa_id = params[:consulta][:pessoa_id]
  #    @consulta.convenio_id = params[:consulta][:convenio_id]
  #    @consulta.valor = params[:consulta][:valor]
  #    @consulta.local_id = params[:consulta][:local_id]
  #    hora = params[:consulta][:hora]
  #    data = params[:consulta][:data]
  #    @consulta.data_hora = "#{data} #{hora}".to_time
  #    @consulta.save
  #
  #    params[:data] = data
  #    alterar_dia
  #  end
end
  