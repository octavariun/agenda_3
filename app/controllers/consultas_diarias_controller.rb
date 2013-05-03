class ConsultasDiariasController < ApplicationController

  before_filter :authenticate_usuario!

  active_scaffold :consulta do |conf|
    conf.list.sorting = {:data_hora => :asc}

    conf.columns = [
      :data_consulta, :hora_consulta, :data_hora, :pessoa,  :convenio, :local, :atendente, :valor, :efetuado, :paga
    ]

   conf.show.columns = [:data_consulta, :hora_consulta, :pessoa,  :convenio, :local, :atendente, :valor, :efetuado, :paga]
   conf.list.columns = [:data_hora, :pessoa,  :convenio, :local, :atendente, :valor, :efetuado, :paga]

        conf.columns[:pessoa].form_ui = :select
        conf.columns[:convenio].form_ui = :select
        conf.columns[:local].form_ui = :select
        conf.columns[:atendente].form_ui = :select
        conf.columns[:pessoa].clear_link
        conf.columns[:convenio].clear_link
        conf.columns[:local].clear_link
        conf.columns[:atendente].clear_link


  end


    def conditions_for_collection
      ["data_hora::date = ?",Date.today]
    end
end