class CidadesController < ApplicationController
  active_scaffold :cidade do |config|
    config.columns = [
      :nome, :estado
    ]
    config.columns[:estado].form_ui = :select
  end

end
