class CargosController < ApplicationController

  #  before_filter :authenticate_usuario!

  active_scaffold :cargo do |conf|
    conf.columns = [
      :nome
    ]
  end
end