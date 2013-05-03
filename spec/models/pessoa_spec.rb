# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Pessoa do

  before(:each) do
    @pessoa = Pessoa.new
  end

  it "deveria validar campos obrigatorios" do
    @pessoa.valid?

    @pessoa.should have(1).errors_on(:nome)
    @pessoa.should have(1).errors_on(:cpf)
    @pessoa.should have(1).errors_on(:telefone)
    @pessoa.should have(1).errors_on(:endereco)
    @pessoa.should have(1).errors_on(:cidade)
  end

  it "deveria validar email com '@' e '.'"do

    @pessoa.email = "sfvsddss"
    @pessoa.valid?
    @pessoa.should have(1).errors_on(:email)
  end
end
