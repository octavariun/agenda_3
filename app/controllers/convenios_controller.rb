class ConveniosController < ApplicationController

  #  before_filter :authenticate_usuario!

  active_scaffold :convenio do |conf|
    conf.columns = [
      :nome
    ]
  end
end 