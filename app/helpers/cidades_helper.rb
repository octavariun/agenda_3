module CidadesHelper
  include InputsHelper
  include PesquisasHelper
  
  def estado_form_column(record,input_name)
    pesquisa_com_auto_complete Estado, 'record', 'estado',
      {:size => 30, :id => "record_estado_#{record.id}", :name => "record_estado_campo_pesquisa_#{record.id}", :class => 'text-input', :style => "margin-left: 5px; margin-right:5px;"},
      {}, {},
      {:name => input_name, :id => "record_estado_#{record.id}_hidden_field"},{:id => "record_estado_#{record.id}_de_controle"}

  end
end
