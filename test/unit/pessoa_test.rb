require 'test_helper'

class PessoaTest < ActiveSupport::TestCase

   test "Se valida campos obrigatorios " do
    pessoa = Pessoa.new
    pessoa.valid?
    assert pessoa.errors[:nome]
    assert pessoa.errors[:cpf]
    assert pessoa.errors[:telefone]
    assert pessoa.errors[:endereco]
    assert pessoa.errors[:cidade]
  end

  test "Se email é valido" do
    pessoa = Pessoa.new
    pessoa.email = "e@123"
    pessoa.valid?
    assert pessoa.errors[:email]
  end

  test "Se email em branco passa" do
    pessoa = Pessoa.new
    pessoa.valid?
    assert pessoa.errors[:email]
  end


end
