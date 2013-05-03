class Convenio < ActiveRecord::Base
  attr_accessible :nome

  validates :nome, :presence => true

  def to_label
    nome
  end
end
