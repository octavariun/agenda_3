# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Convenio do

  it "deveria validar campos obrigatorios" do
    convenio = Convenio.new
    convenio.valid?

    convenio.should have(1).errors_on(:nome)
  end

end
