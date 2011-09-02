class Convenio < ActiveRecord::Base
  validates_presence_of :nome


  pesquisar_por "convenios.id", "convenios.nome"

  def descricao_para_pesquisa
    "#{nome}"
  end

  def to_label
    nome
  end
end
