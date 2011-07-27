class PesquisasController < ApplicationController


  def auto_complete_para_pesquisa
    @resultado = []
    @resultado = params[:classe].camelize.constantize.pesquisar(params[:busca], :limite => 15, :condicoes => params[:condicoes]) unless params[:busca].blank?

    div_resultados = '@resultado.map { |r| hidden_field_tag("resultados_pesquisa_#{r.descricao_para_pesquisa.gsub(" ","")}", r.id, :disabled => true) }'
    render :inline => "<%= content_tag('ul', @resultado.map { |resultado| content_tag('li', h(resultado.descricao_para_pesquisa))}) + content_tag('div', #{div_resultados}) %>"
  end

  def busca
    @resultado = []
    @resultado = params[:classe].camelize.constantize.pesquisar(params[:busca], :condicoes => params[:condicoes]).first unless params[:busca].blank?
    render :update do |page|
      page << "if($('#{params[:hidden_field_id]}')) {"
#        page << "console.log('#{@resultado.id}')"
        page[params[:hidden_field_id]].value = @resultado.blank? ? "" : @resultado.id
#        page << "console.log($('#{params[:hidden_field_id]}').value)"
        page[params[:text_field_id]].value = @resultado.blank? ? "Registro não encontrado" : @resultado.descricao_para_pesquisa
        page[params[:hidden_field_de_controle]].value = @resultado.blank? ? nil : @resultado.descricao_para_pesquisa
      page << "}"
    end
  end
end