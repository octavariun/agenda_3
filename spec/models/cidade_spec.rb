# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Cidade do

  it "deveria validar campos obrigatorios" do
    cidade = Cidade.new
    cidade.valid?

    cidade.should have(1).errors_on(:nome)
    cidade.should have(1).errors_on(:estado)
  end

end
