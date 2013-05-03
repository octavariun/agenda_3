require 'spec_helper'

describe Usuario do

  it "deveria validar os campos obrigatorios" do
    usuario = Usuario.new

    usuario.valid?

    usuario.should have(1).errors_on(:login)
    usuario.should have(1).errors_on(:password)
  end

   it "deveria validar como unico o usuario" do
    usuario1 = Usuario.new
    usuario1.login = "cassio"
    usuario1.password = "12345"
    usuario1.save

    usuario2 = Usuario.new
    usuario2.login = "cassio"
    usuario2.password = "12345"
    usuario2.valid?

    
    usuario2.should have(1).errors_on(:login)
  end

end
