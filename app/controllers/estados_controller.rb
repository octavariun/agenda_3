class EstadosController < ApplicationController
  
  before_filter :authenticate_usuario!

  active_scaffold :estado do |conf|
    conf.columns = [
      :nome, :sigla
    ]
  end
end 