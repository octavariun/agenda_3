class Cidade < ActiveRecord::Base
  belongs_to :estado
  attr_accessible :nome

  validates :nome, :estado, :presence => true

  def to_label
    nome
  end
end
