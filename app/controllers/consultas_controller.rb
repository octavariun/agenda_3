class ConsultasController < ApplicationController
  
  before_filter :authenticate_usuario!

  active_scaffold :consulta do |conf|
    conf.list.sorting = {:data_hora => :desc}
    conf.columns = [
      :data_consulta, :hora_consulta, :data_hora, :pessoa,  :convenio, :local, :atendente, :valor, :efetuado, :paga
    ]

   conf.show.columns = [:data_consulta, :hora_consulta, :pessoa,  :convenio, :local, :atendente, :valor, :efetuado, :paga]
   conf.list.columns = [:data_hora, :pessoa,  :convenio, :local, :atendente, :valor, :efetuado, :paga]
   conf.create.columns = [:data_consulta, :hora_consulta, :pessoa,  :convenio, :local, :atendente, :valor, :efetuado, :paga]
   conf.update.columns = [:data_consulta, :hora_consulta, :pessoa,  :convenio, :local, :atendente, :valor, :efetuado, :paga]


   conf.columns[:pessoa].form_ui = :select
   conf.columns[:convenio].form_ui = :select
   conf.columns[:local].form_ui = :select
   conf.columns[:atendente].form_ui = :select
   conf.columns[:pessoa].clear_link
   conf.columns[:convenio].clear_link
   conf.columns[:local].clear_link
   conf.columns[:atendente].clear_link
   conf.columns[:efetuado].inplace_edit = :true
   conf.columns[:paga].inplace_edit = :true
     
   conf.actions.exclude :search
   conf.actions.add :field_search
   conf.field_search.human_conditions = true
   conf.field_search.columns = [:pessoa, :data_consulta, :convenio, :local, :atendente, :valor, :efetuado, :paga]
  end


  def update_column
    if params[:column] == 'efetuado'
      Consulta.find(params[:id]).update_attribute(:efetuado, params[:value])
      render :nothing => true
    elsif params[:column] == 'paga'
      Consulta.find(params[:id]).update_attribute(:paga, params[:value])
      render :nothing => true
    else
      super
    end
  end


  def relatorio_geral_de_consultas
  end

  def exibir_relatorio
    @mensagens = ""

    data = ''
    data_inicial = params[:data_inicial].each{|k,v| data = data+v+"-"}
    data_inicial = data.to_date.to_s rescue nil


    data = ''
    data_final = params[:data_final].each{|k,v| data = data+v+"-"}
    data_final = data.to_date.to_s rescue nil
    

    if data_inicial.blank? || data_final.blank?
    @mensagens = 'Por favor preencha os campos corretamente para gerar o relatorio.'
    else
    
      @consultas = Consulta.all.select {|x|x.data_hora.to_date.to_s > data_inicial and x.data_hora.to_date.to_s < data_final and x.atendente_id == params[:atendente].to_i }
    end
    
  end


end 