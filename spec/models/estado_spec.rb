# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Estado do

  it "deveria validar campos obrigatorios" do
    estado = Estado.new
    estado.valid?

    estado.should have(1).errors_on(:nome)
    estado.should have(2).errors_on(:sigla)
  end

  it "deveria validar formato da sigla" do
    estado = Estado.new
    estado.sigla = "paranaaa"
    estado.valid?

    estado.should have(1).errors_on(:sigla)
  end

end
