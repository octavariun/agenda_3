class PessoasController < ApplicationController
 active_scaffold :pessoa do |config|
    config.columns = [
      :nome, :cpf, :email, :telefone, :endereco, :bairro, :numero, :cep, :cidade
    ]
    
    config.columns[:cidade].form_ui = :select
 end
end
