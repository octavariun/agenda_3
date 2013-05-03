class Atendente < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :cargo
  attr_accessible :nome

  validates :nome, :cargo, :usuario, :presence => true

  def to_label
    nome
  end

end
