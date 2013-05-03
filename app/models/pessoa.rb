class Pessoa < ActiveRecord::Base

  belongs_to :cidade
  attr_accessible :bairro, :cep, :cpf, :email, :endereco, :nome, :numero, :telefone

  validates :nome, :cpf, :telefone, :endereco, :cidade, :presence => true
  validates :email, :email => true, :if => proc {|c| !c.email.blank?}

  def to_label
    nome
  end
end
