class LocaisController < ApplicationController
  active_scaffold :local do |config|
    config.columns = [
      :nome, :quantidade
    ]
    config.columns[:quantidade].label = "Quantidade de Pessoas"
  end
 
end
