class PessoasController < ApplicationController

  #  before_filter :authenticate_usuario!

  active_scaffold :pessoa do |conf|
    conf.columns = [
      :nome, :cpf, :email, :telefone, :endereco, :bairro, :numero, :cep, :cidade
    ]
    conf.columns[:cidade].form_ui = :select
    conf.columns[:cidade].clear_link
  end
end