class Local < ActiveRecord::Base
  has_many :consultas
  validates_presence_of :nome, :quantidade


  pesquisar_por "locais.id", "locais.nome"

  def descricao_para_pesquisa
    "#{id} - #{nome}"
  end

  def to_label
    self.nome
  end
end
