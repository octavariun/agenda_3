class Estado < ActiveRecord::Base
  validates_presence_of :nome
  validates_format_of :sigla, :with => /^[A-Z]{2}$/i

  pesquisar_por "estados.id", "estados.nome"

  def descricao_para_pesquisa
    "#{id} - #{nome}"
  end

  def to_label
    nome
  end

end
