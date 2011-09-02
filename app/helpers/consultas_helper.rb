module ConsultasHelper

  include InputsHelper
  include PesquisasHelper
  #  include ApplicationHelper


  def pessoa_form_column(record,input_name)
    pesquisa_com_auto_complete Pessoa, 'record', 'pessoa',
      {:size => 30, :id => "record_pessoa_#{record.id}", :name => "record_pessoa_campo_pesquisa_#{record.id}", :class => 'text-input', :style => "margin-left: 5px; margin-right:5px;"},
      {}, {},
      {:name => input_name, :id => "record_pessoa_#{record.id}_hidden_field"},{:id => "record_pessoa_#{record.id}_de_controle"}

  end

  def convenio_form_column(record,input_name)
    pesquisa_com_auto_complete Convenio, 'record', 'convenio',
      {:size => 30, :id => "record_convenio_#{record.id}", :name => "record_convenio_campo_pesquisa_#{record.id}", :class => 'text-input', :style => "margin-left: 5px; margin-right:5px;"},
      {}, {},
      {:name => input_name, :id => "record_convenio_#{record.id}_hidden_field"},{:id => "record_convenio_#{record.id}_de_controle"}

  end

  def local_form_column(record,input_name)
    pesquisa_com_auto_complete Local, 'record', 'local',
      {:size => 30, :id => "record_local_#{record.id}", :name => "record_local_campo_pesquisa_#{record.id}", :class => 'text-input', :style => "margin-left: 5px; margin-right:5px;"},
      {}, {},
      {:name => input_name, :id => "record_local_#{record.id}_hidden_field"},{:id => "record_local_#{record.id}_de_controle"}

  end

  def efetuado_form_column(record,input_name)
    check_box_tag "Efetuado", true, record.efetuado, :onclick => remote_function(:url => {:action => "gravar_efetuado"},:with => "'consulta_id=#{record.id}&efetuado=' + this.checked")
  end


 
end
