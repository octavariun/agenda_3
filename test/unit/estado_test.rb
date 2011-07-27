require 'test_helper'

class EstadoTest < ActiveSupport::TestCase
  test "Se valida campos obrigatorios" do
    estado = Estado.new
    estado.valid?
    assert estado.errors[:nome]
    assert estado.errors[:sigla]
  end

  test "Se valida tamanho da sigla" do
    estado = Estado.new
    estado.nome = 'parana'
    estado.sigla = 'p2'
    estado.valid?
    assert estado.errors[:sigla]
  end
  
end
