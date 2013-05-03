class AtendentesController < ApplicationController
  active_scaffold :atendente do |conf|

    conf.columns = [
      :nome, :cargo, :usuario
    ]
    conf.columns[:usuario].form_ui = :select
    conf.columns[:cargo].form_ui = :select
    conf.columns[:cargo].clear_link
  end
end 