class Estado < ActiveRecord::Base
  attr_accessible :nome, :sigla

  validates :nome, :sigla, :presence => true
  validates :sigla, :format => {:with => /^[A-Z]{2}$/i}

  
  def to_label
    nome
  end

end
