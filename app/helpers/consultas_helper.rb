module ConsultasHelper


#def user_type_search_column(record, input_name)
#		select :record, :user_type, options_for_select(User.user_types), {:include_blank => as_(:_select_)}, input_name
#	end


#def data_hora_search_column(record, html_options)
#  selected = html_options.delete :value
##  puts "caraio!"
##  selected
#  #
#  consultas = Consulta.select('distinct data_hora').except(:order).order('data_hora DESC').all
#  select_options =
#    consultas.collect do |consulta|
#    [ l(consulta.data_hora), consulta.data_hora ]
#  end
##
#  options = { :selected => selected,
#                  :include_blank => as_(:_select_)}
#  select(:record, :data_hora, select_options, options, html_options)
#end

end