class LocaisController < ApplicationController
  
  #  before_filter :authenticate_usuario!

  active_scaffold :local do |conf|
    conf.columns = [
      :nome, :quantidade
    ]
  end
end 