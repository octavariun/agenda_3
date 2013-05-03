class Local < ActiveRecord::Base

  has_many :consultas
  attr_accessible :nome, :quantidade

  validates :nome, :quantidade, :presence => true

  def to_label
    nome
  end
end
