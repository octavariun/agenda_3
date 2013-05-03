# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Local do

it "deveria validar campos obrigatorios" do
    local = Local.new
    local.valid?

    local.should have(1).errors_on(:nome)
    local.should have(1).errors_on(:quantidade)
  end

end
