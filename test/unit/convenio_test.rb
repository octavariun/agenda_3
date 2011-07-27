require 'test_helper'

class ConvenioTest < ActiveSupport::TestCase
 test "Se valida campos obrigatorios" do
    convenio = Convenio.new
    convenio.valid?

    assert convenio.errors[:nome]

  end
end
