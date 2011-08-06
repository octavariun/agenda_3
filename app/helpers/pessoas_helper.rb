module PessoasHelper
  
  def cidade_form_column(record,input_name)
    pesquisa_com_auto_complete Cidade, 'record', 'cidade',
      {:size => 30, :id => "record_cidade_#{record.id}", :name => "record_cidade_campo_pesquisa_#{record.id}", :class => 'text-input', :style => "margin-left: 5px; margin-right:5px;"},
      {}, {},
      {:name => input_name, :id => "record_cidade_#{record.id}_hidden_field"},{:id => "record_cidade_#{record.id}_de_controle"}

  end
end
