class Cidade < ActiveRecord::Base
  belongs_to :estado

  validates_presence_of :nome, :estado

  def to_label
    nome
  end
end
