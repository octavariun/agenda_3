class Cidade < ActiveRecord::Base
  belongs_to :estado

  validates_presence_of :nome, :estado

  pesquisar_por "cidades.id", "cidades.nome"

  def descricao_para_pesquisa
    "#{id} - #{nome}"
  end


  def to_label
    nome
  end
end
