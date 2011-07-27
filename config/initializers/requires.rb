require "#{RAILS_ROOT}/lib/active_record_extensions"
require "#{RAILS_ROOT}/lib/string_extensions"

ActiveRecord::Base.send :include, ActiveRecordPesquisa

#CalendarDateSelect::FORMATS[:my_custom] = {
#  # Here's the code to pass to Date#strftime
#  :date => "%d/%m/%Y",
#  :time => " %I:%M %p",  # notice the space before time.  If you want date and time to be seperated with a space, put the leading space here.
#
#  :javascript_include => "format_my_custom"
#}

