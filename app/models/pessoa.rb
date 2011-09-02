class Pessoa < ActiveRecord::Base
  belongs_to :cidade

  validates_presence_of :nome, :cpf, :telefone, :endereco, :cidade
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i unless :email.blank?


  pesquisar_por "pessoas.id", "pessoas.nome"

  def descricao_para_pesquisa
    "#{nome}"
  end
  
  def to_label
    nome
  end
end
