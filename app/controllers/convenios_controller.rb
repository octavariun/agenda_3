class ConveniosController < ApplicationController
  active_scaffold :convenio do |config|
    config.columns = [
      :nome
    ]
  end
end
