module PesquisasHelper
  include InputsHelper

  def pesquisa_com_auto_complete(classe_a_pesquisar, object, method, html_options = {}, options = {}, opcoes_pesquisa = {}, options_hidden_field = {}, options_campo_controle = {})

    name_hidden_field = options_hidden_field[:name].blank? ? "#{object}[#{method}_id]" : options_hidden_field[:name]
    id_hidden_field = options_hidden_field[:id].blank? ? "#{object}_#{method}_id" : options_hidden_field[:id]
    hidden_field_de_controle = options_campo_controle[:id].blank? ? "#{object}_#{method}_de_controle" : options_campo_controle[:id]

    id_text_field = html_options[:id].blank? ? "#{object}_#{method}_campo_pesquisa" : html_options[:id]
    parametros_classe_e_busca = '"classe='+classe_a_pesquisar.to_s.underscore+'&busca="+$("'+id_text_field.to_s+'").value+"&condicoes='+opcoes_pesquisa[:condicoes].to_s+'"'
    metodo_de_busca = remote_function(:url => {:controller => 'pesquisas', :action => 'busca'}, :with => parametros_classe_e_busca + "+'&'+'hidden_field_id=#{id_hidden_field}'+'&'+'text_field_id='+'#{id_text_field}'+'&'+'hidden_field_de_controle=#{hidden_field_de_controle}'")
    funcao_atualiza_hidden_fields = "function (element, value) {$('#{id_hidden_field}').value = document.getElementsByName('resultados_pesquisa_'+value.innerHTML.gsub(' ',''))[0].value; $('#{hidden_field_de_controle}').value = element.value}"
    valor_authenticity_token = protect_against_forgery? ? '"'+request_forgery_protection_token.to_s+'=" + encodeURIComponent("'+form_authenticity_token.to_s+'")' : ""

    objeto = eval("@#{object}")
    valor_campo_pesquisa = ""
    valor_hidden_field = nil
    valor_hidden_field_de_controle = nil
    inicio_div_erros =""
    fim_div_erros = ""
    unless objeto.blank?
      unless objeto.send(method).blank?
        valor_campo_pesquisa = objeto.send(method).descricao_para_pesquisa
        valor_hidden_field = objeto.send(method).id
        valor_hidden_field_de_controle = objeto.send(method).descricao_para_pesquisa
      end
      if (!objeto.errors[method].blank? || !objeto.errors["#{method}_id"].blank?)
        inicio_div_erros = "<div class=fieldWithErrors>"
        fim_div_erros = "</div>"
      end
    end

    onblur = html_options[:onblur] || ""
    html_options.delete(:onblur)

    onkeypress = html_options[:onkeypress] || ""
    html_options.delete(:onkeypress)

    (options[:skip_style] ? "" : auto_complete_stylesheet) +
      inicio_div_erros.html_safe +
      text_field_tag("#{object}_#{method}_campo_pesquisa", nil, {
        #        :onfocus => "$('#{hidden_field_de_controle}').value = 'false'",
        :onfocus => "if (this.value == 'Registro não encontrado') {this.value = ''}",
        :onblur => "if ($('#{hidden_field_de_controle}').value.gsub(' ','') != $('#{id_text_field}').value.gsub(' ','') && $('#{id_text_field}_auto_complete').style.display == 'none') {#{metodo_de_busca}};".concat(onblur),
        :size => 60,
        :value => valor_campo_pesquisa,
        :onkeydown => "if(($('#{hidden_field_de_controle}').value) != this.value ) $('#{id_hidden_field}').value = ''",
        :onkeypress => "if (event.keyCode == 13 && $('#{id_text_field}_auto_complete').style.display != 'none') return false;".concat(onkeypress)
      }.update(html_options)) + fim_div_erros.html_safe +

      content_tag("div", "", :id => "#{id_text_field}_auto_complete", :class => "auto_complete") +

      auto_complete_field(id_text_field, {
        :frequency => 0.4, :with => parametros_classe_e_busca + '+"&"+'+valor_authenticity_token,
        :after_update_element => funcao_atualiza_hidden_fields,
        :url => {:controller => 'pesquisas', :action => 'auto_complete_para_pesquisa'}}.update(options)) +

      hidden_field_tag(name_hidden_field, valor_hidden_field, {:id => id_hidden_field}.update(options_hidden_field)) +
      hidden_field_tag(hidden_field_de_controle, valor_hidden_field_de_controle, {:id => hidden_field_de_controle}.update(options_campo_controle))
  end

#  def checkboxes_com_pesquisa(itens,record)
#    grupos = contexto.send(itens).ativos(:order => "grupo_de_#{itens}_id").inject({}) do |retorno, item|
#      descricao = (item.send("grupo_de_#{itens}").descricao rescue "#{itens.capitalize} sem grupo")
#      retorno[descricao] ||= []
#      retorno[descricao] << item
#      retorno
#    end
#
#
#    h = HtmlGenerator.new
#
#    h.append "Pesquisar por:"
#
#    h.append "<br/>"
#
#    limpa_pesquisa = "$('comissoes_#{itens}_#{record.id}').getElementsBySelector('li').each(function(li){li.show();}); $('campo_pesquisa_#{itens}_#{record.id}').value = 'Pesquisar'"
#
#    h.append radio_button_tag(
#      "#{itens}_pesquisar_por_#{record.id}",
#      "GRUPOS",
#      true,
#      :id => "#{itens}_pesquisar_por_grupo_#{record.id}",
#      :onclick => limpa_pesquisa
#    )
#
#    h.append label_tag("#{itens}_pesquisar_por_grupo_#{record.id}", "Grupo", :style => "display:inline;")
#
#    h.append radio_button_tag(
#      "#{itens}_pesquisar_por_#{record.id}",
#      "ITENS",
#      false,
#      :id => "#{itens}_pesquisar_por_#{itens}_#{record.id}",
#      :onclick => limpa_pesquisa
#    )
#
#    h.append label_tag("#{itens}_pesquisar_por_#{itens}_#{record.id}", "#{itens.humanize}", :style => "display:inline;")
#
#    h.append "<br/>"
#    h.append "<br/>"
#
#    h.append text_field_tag nil, "Pesquisar",
#      :class => "text",
#      :onkeyup => "live_search_comissoes('comissoes_#{itens}_#{record.id}', this.value.toLowerCase(),$$('input[name=#{itens}_pesquisar_por_#{record.id}]:checked')[0].value);",
#      :onblur => "if (this.value == '') this.value = 'Pesquisar'",
#      :onfocus => "if (this.value == 'Pesquisar') this.value = ''",
#      :id => "campo_pesquisa_#{itens}_#{record.id}"
#
#    h.append "<br/>"
#    h.append "<br/>"
#
#    ol_id = "comissoes_#{itens}_#{record.id}"
#
#    h.append "Marcar: "
#    h.a({:onclick => marcar_todos(ol_id, "true")}, "Todos")
#    h.append ", "
#    h.a({:onclick => marcar_todos(ol_id, "false")}, "Nenhum")
#
#    h.append "<br/>"
#    h.append "<br/>"
#
#
#    h.ol :id => ol_id do
#      grupos.each_with_index do |grupo_e_itens, index|
#        grupo, itens_do_grupo = grupo_e_itens
#
#        h.li :name => grupo.downcase do
#          h.append check_box_tag nil, nil, false,
#            :onclick => "var checked = this.checked; this.next().next().getElementsBySelector('input').each(function(input) { if (input.up().visible()) input.checked = checked;})",
#            :id => "grupo_#{itens}_#{index}_#{record.id}"
#          h.append label_tag "grupo_#{itens}_#{index}_#{record.id}", grupo, :style => "display:inline;"
#
#          h.ol do
#            itens_do_grupo.each_with_index do |item, index|
#              h.li :name => item.to_label.downcase do
#                html_id = "grupo_#{itens}_#{item.id}_#{record.id}"
#                checked = record.send(itens).include?(item)
#
#                h.append check_box_tag(
#                  "record[grupo][#{itens.singularize}][#{item.id}]",
#                  item.id,
#                  checked,
#                  :id => html_id
#                )
#
#                color = '#555555'
#
#                if checked
#                  color = 'red' if record.send("#{itens}_validacao").include?(item.id) rescue false
#                end
#
#                h.append label_tag html_id, item.to_label, :style => "color: #{color}; display:inline;"
#              end
#            end
#          end
#        end
#      end
#    end
#  end

  def checkboxes_com_pesquisa_simples(classe, registros,label,name, checked, tem_erro = proc {false})
    #  def checkboxes_com_pesquisa_simples(record,classe,campos)
    #    faixas = contexto.send(classe.to_s.pluralize.underscore).all(:order => "#{campos[0]}, #{campos[1]}")

    h = HtmlGenerator.new

    h.append "<br/>"
    h.append "<br/>"


    h.append text_field_tag nil, "Pesquisar",
      :class => "text",
      :onkeyup => "live_search('#pesquisa_#{classe.to_s.pluralize.underscore}_#{params[:id]}>li', this.value.toLowerCase());",
      :onblur => "if (this.value == '') this.value = 'Pesquisar'",
      :onfocus => "if (this.value == 'Pesquisar') this.value = ''",
      :id => "campo_pesquisa_#{classe.to_s.downcase}_#{params[:id]}"

    h.append "<br/>"
    h.append "<br/>"

    h.append "Marcar: "
    h.a({:onclick => marcar_todos("pesquisa_#{classe.to_s.pluralize.underscore}_#{params[:id]}", "true")}, "Todos")
    h.append ", "
    h.a({:onclick => marcar_todos("pesquisa_#{classe.to_s.pluralize.underscore}_#{params[:id]}", "false")}, "Nenhum")

    h.append "<br/>"
    h.append "<br/>"


    h.ol :id => "pesquisa_#{classe.to_s.pluralize.underscore}_#{params[:id]}" do
      registros.each_with_index do |registro, index|
        h.li :name => registro.to_label.downcase.gsub('.','') do
          #          html_id = "grupo_#{classe.to_s.underscore}_#{faixa.id}_#{params[:id]}"
          html_id = "#{name.gsub(/\]\[|\[|\]/, '_')}#{registro.id}_#{params[:id]}"

          h.append check_box_tag(
            "#{name}[#{registro.id}]",
            registro.id,
            checked.call(registro),
            :id => html_id
          )

          color = '#555555'

          if checked.call(registro)
            color = 'red' if tem_erro.call(registro)
          end

          h.append label_tag html_id, label.call(registro), :style => "color: #{color}; display:inline;"
        end
      end
    end
  end


  private

  def marcar_todos(ol_id, checked)
    "$('#{ol_id}').getElementsBySelector('input[type=checkbox]').each(function(input) { if (input.up().visible()) input.checked = #{checked} })"
  end

  def auto_complete_stylesheet
    content_tag('style', <<-EOT, :type => Mime::CSS)
        div.auto_complete {
          width: 350px;
          background: #fff;
        }
        div.auto_complete ul {
          border:1px solid #888;
          margin:0;
          padding:0;
          width:100%;
          list-style-type:none;
        }
        div.auto_complete ul li {
          margin:0;
          padding:3px;
        }
        div.auto_complete ul li.selected {
          background-color: lightBlue;
        }
        div.auto_complete ul strong.highlight {
          color: #800;
          margin:0;
          padding:0;
        }
    EOT
  end
end