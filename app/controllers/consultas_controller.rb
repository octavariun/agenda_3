class ConsultasController < ApplicationController
  #  before_filter :teste, :only => :index
  active_scaffold :consulta do |config|
    config.columns = [
      :data_hora, :pessoa, :local, :convenio, :valor, :efetuado
    ]
    config.columns[:pessoa].form_ui = :select
    config.columns[:local].form_ui = :select
    config.columns[:convenio].form_ui = :select
    config.columns[:efetuado].form_ui = :checkbox
    config.columns[:data_hora].form_ui = :calendar_date_select
    config.list.sorting = [{ :data_hora => :asc}, {:pessoa_id => :asc }]
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
 
  #  def gravar_convenio
  #    consulta = Consulta.find(params[:consulta_id])
  #    consulta.convenio = Convenio.find(params[:convenio_id])
  #    consulta.save
  #    render :nothing => true
  #  end
  #
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
  