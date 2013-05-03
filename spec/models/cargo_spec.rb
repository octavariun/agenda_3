# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Cargo do

  it "deveria validar campos obrigatorios" do
    cargo = Cargo.new
    cargo.valid?

    cargo.should have(1).errors_on(:nome)
  end

end
