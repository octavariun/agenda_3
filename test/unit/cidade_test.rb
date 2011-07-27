require 'test_helper'

class CidadeTest < ActiveSupport::TestCase

  test "Se valida campos obrigatorios" do
    cidade = Cidade.new
    cidade.valid?

    assert cidade.errors[:nome]
    assert cidade.errors[:estado]
  end

end
