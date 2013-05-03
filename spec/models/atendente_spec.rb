# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Atendente do
  it "deveria validar campos obrigatorios" do
    atendente = Atendente.new
    atendente.valid?

    atendente.should have(1).errors_on(:nome)
    atendente.should have(1).errors_on(:cargo)
    atendente.should have(1).errors_on(:usuario)
  end
end
