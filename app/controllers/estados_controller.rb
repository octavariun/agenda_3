class EstadosController < ApplicationController
  active_scaffold :estado do |config|
    config.columns = [
      :nome, :sigla
    ]
  end
end
