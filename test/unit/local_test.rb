require 'test_helper'

class LocalTest < ActiveSupport::TestCase

  test "Se valida campos obrigatorios" do
    local = Local.new
    local.valid?
    assert local.errors[:nome]
    assert local.errors[:quantidade]
  end
  
end
