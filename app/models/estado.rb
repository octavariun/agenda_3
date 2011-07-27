class Estado < ActiveRecord::Base
  validates_presence_of :nome, :sigla
  validates_format_of :sigla, :with => /^[A-Z]{2}$/i

  def to_label
    nome
  end

end
