module InputsHelper

  include CalendarDateSelect::FormHelpers
  include ActionView::Helpers::JavaScriptHelper
  include ActionView::Helpers::AssetTagHelper

  def money_field(object, method, options)
    text_field_monetario(object, method, options)
  end

  def text_field_monetario(object, method, options)
    options[:casas_decimais] ||= 2
    options[:onkeypress] = "return formataReais(this, event, #{options[:casas_decimais]});#{options[:onkeypress]}"
    options[:onkeydown] = "#{options[:onkeydown]};return formataReaisKeyDown(this, event, #{options[:casas_decimais]})"

    text_field(object, method, options)
  end

  def text_field_tag_monetario name, value, options = {}
    options[:casas_decimais] ||= 2 
    
    options[:onkeypress] = "return formataReais(this, event, #{options[:casas_decimais]});#{options[:onkeypress]}"
    #    options[:onkeydown] = "#{options[:onkeydown]}"
    options[:onkeydown] = "#{options[:onkeydown]};return formataReaisKeyDown(this, event, #{options[:casas_decimais]})"

    text_field_tag name, value, options
  end
  
  def text_field_tag_com_validacao name, value, options = {}
    if options[:tem_erro]      
      "<div class=\"fieldWithErrors\">" +
        text_field_tag(name, value, define_options(options)) + div_validacao(options[:id]) +
        "</div>"
    else
      text_field_tag(name, value, define_options(options)) + div_validacao(options[:id])
    end
  end
  
  def text_field_tag_monetario_com_validacao name, value, options = {}
    if options[:tem_erro]      
      "<div class=\"fieldWithErrors\">" +
        text_field_tag_monetario(name, value, define_options(options)) + div_validacao(options[:id]) +
        "</div>"
    else
      text_field_tag_monetario(name, value, define_options(options)) + div_validacao(options[:id])
    end
  end

  #  
  #  # Retorna um input com uma div escondida que brota se o campo de texto estiver inválido (recomendável passar :id)
  #  #
  #  # ==== Exemplos
  #  #   text_field_validador_para_texto "pessoa[nome]", @pessoa.nome, 
  #  #     :minimo => 0, :maximo => 80, :id => "pessoa[nome]" + @pessoa.id
  #  def text_field_validador_para_texto name, value, options = {}
  #    
  #    tag = options[:posicao] == :abaixo ? 'p' : 'span'
  #    
  #    if options[:validar_com].blank?
  #      options[:mensagem] = "<strong> Campo inválido. </strong>"
  #      options[:mensagem] += "<#{tag} style=\"color: black\"> Mímino de #{options[:minimo]} caracter#{(options[:minimo] > 1 ? 'es' : '')}. </#{tag}>" unless options[:minimo].blank?
  #      options[:mensagem] += "<#{tag} style=\"color: black\"> Máximo de #{options[:maximo]} caracter#{(options[:maximo] > 1 ? 'es' : '')}. </#{tag}>" unless options[:maximo].blank?
  #    end
  #
  #    options[:validar_com] = options[:validar_com].blank? ? "true " : options[:validar_com]
  #    options[:validar_com] += options[:minimo].blank? ? " && true " : " && (this.value.length >= #{options[:minimo]})"
  #    options[:validar_com] += options[:maximo].blank? ? " && true " : " && (this.value.length <= #{options[:maximo]})"
  #   
  #    options[:maxlength] = options[:maximo]
  #    
  #    [:maximo, :minimo].each { |o| options.delete(o) }        
  #    
  #    text_field_tag_com_validacao name, value, options
  #    
  #  end
  #
  #  # Retorna um input com uma div escondida que brota se o campo de data estiver inválido (recomendável passar :id)
  #  #
  #  # ==== Exemplos
  #  #   text_field_validador_para_data "emprestimo[emissao]", @emprestimo.emissao, 
  #  #     :minimo => Date.today, :maximo => "$('emprestimo_vencimento_inicial')"
  #  #
  #  #   text_field_validador_para_data "emprestimo[vencimento_inicial]", 
  #  #     @emprestimo.vencimento_inicial, :minimo => "$('emprestimo_emissao')"

  def text_field_validador_para_data name, value, options = {}
    #    classes_de_data = [Date, DateTime, Time]
    #    tag = options[:posicao] == :abaixo ? 'p' : 'span'
    #
    #    #    data_do_input = "(new Date(this.value.substr(6,4), this.value.substr(3,2), this.value.substr(0,2)))"
    #    data_do_input = "(new Date(ajustaAno(this.value.split('/')[2]), this.value.split('/')[1] - 1, this.value.split('/')[0]))"
    #
    #    #    #TODO: ver uma forma de não repetir os trechos abaixo
    #    #TODO: descomentar quando for utilizar
    #    unless options[:maximo].blank?
    #      if classes_de_data.include? options[:maximo].class
    #        data_maxima_js = "(new Date(#{options[:maximo].year}, #{options[:maximo].month}, #{options[:maximo].day}))"
    #        data_maxima = options[:maximo].to_s_br
    #        #      elsif options[:maximo].is_a? String
    #        #        #        data_maxima_js = "(new Date(#{options[:maximo]}.value.substr(6,4), #{options[:maximo]}.value.substr(3,2), #{options[:maximo]}.value.substr(0,2)))"
    #        #        data_maxima_js = "(new Date(ajustaAno(#{options[:maximo]}.value.split('/')[2]), #{options[:maximo]}.value.split('/')[1] - 1, #{options[:maximo]}.value.split('/')[0]))"
    #        #        data_maxima = "<span id=\"span_msg_data_maxima_#{options[:id]}\"> </span>"
    #        #        options[:onvalidar] = "$('span_msg_data_maxima_#{options[:id]}').innerHTML = #{options[:maximo]}.value;#{options[:onvalidar]}"
    #      end
    #    end
    #
    #    unless options[:minimo].blank?
    #      if classes_de_data.include? options[:minimo].class
    #        data_minima_js = "(new Date(ajustaAno(#{options[:minimo].year}), #{options[:minimo].month}-1, #{options[:minimo].day}))"
    #        data_minima = options[:minimo].to_s_br
    #      elsif options[:minimo].is_a? String
    #        data_minima_js = "(new Date(ajustaAno(#{options[:minimo]}.value.split('/')[2]), #{options[:minimo]}.value.split('/')[1] - 1, #{options[:minimo]}.value.split('/')[0]))"
    #        data_minima = "<span id=\"span_msg_data_minima_#{options[:id]}\"> </span>"
    #        options[:onvalidar] = "$('span_msg_data_minima_#{options[:id]}').innerHTML = #{options[:minimo]}.value;#{options[:onvalidar]}"
    #      end
    #    end
    #
    #    condicao1 = options[:maximo].blank? ? " true " : "(#{data_do_input} <= #{data_maxima_js})"
    #    condicao2 = options[:minimo].blank? ? " true " : "(#{data_do_input} >= #{data_minima_js})"
    #    condicao3 = "this.value.split('/').length == 3 && this.value.split('/')[2] != ''"
    #
    #    if options[:validar_com].blank?
    #      options[:mensagem] = "<strong> Data inválida. </strong>"
    #      options[:mensagem] += "<#{tag} style=\"color: black\"> Data mínima: #{data_minima}. </#{tag}>" unless options[:minimo].blank?
    #      options[:mensagem] += "<#{tag} style=\"color: black\"> Data máxima: #{data_maxima}. </#{tag}>" unless options[:maximo].blank?
    #    end
    #
    #
    #    options[:validar_com] = "#{condicao1} && #{condicao2} && #{condicao3}"
    #
    #    [:maximo, :minimo].each { |o| options.delete(o) }
    #
    #    options[:onkeypress] = "return Formatadata(this, event); if (this.keyCode == 13) ajustaAnoOnBlur(this);#{options[:onkeypress]}"
    #    options[:onkeydown] = "return FormataDataKeyDown(this, event);#{options[:onkeydown]}"
    #    options[:onblur] = "ajustaAnoOnBlur(this);#{options[:onblur]}"
    #    options[:maxlength] ||= 10
    #
    #    text_field_tag_com_validacao name, value, options

    if options[:tem_erro]
      "<div class=\"fieldWithErrors\">" +
        date_field_tag(name, value, options) +
        "</div>"
    else
      date_field_tag(name, value, options)
    end
  end

  def date_field(object, method, options = {})
    options = options_date_field(options)

    calendar_date_select(object, method, options)
  end

  def date_field_tag(name, value, options = {})
    options = options_date_field(options)

    calendar_date_select_tag(name, value, options)
  end

  def options_date_field(options)
    options[:onkeypress] = "return Formatadata(this, event); if (this.keyCode == 13) ajustaAnoOnBlur(this);#{options[:onkeypress]}"
    options[:onkeydown] = "return FormataDataKeyDown(this, event);#{options[:onkeydown]}"
    options[:onblur] = "ajustaAnoOnBlur(this);#{options[:onblur]}"
    options[:maxlength] ||= 10
    options
  end

  #  # Retorna um input com uma div escondida que brota se o campo de valor real estiver inválido (recomendável passar :id)
  #  #
  #  # ==== Exemplos
  #  # colocar exemplos!!!
  def text_field_validador_para_numero name, value, options = {}
    # só muda o nome das variáveis =(
    
    tag = options[:posicao] == :abaixo ? 'p' : 'span'
    options[:casas_decimais] ||= 2
    
    tipo = options[:tipo]
    
    classes = [Dinheiro, Float, Fixnum, Numeric]
    
    valor_do_input = "reaisParaFloat(this.value)"
    
    unless options[:maximo].blank?
      if classes.include? options[:maximo].class
        valor_maximo_js = "#{options[:maximo]}"
        valor_maximo = (tipo == :inteiro ? options[:maximo].to_i : options[:maximo].reais)
      elsif options[:maximo].is_a? String
        valor_maximo_js = "reaisParaFloat(#{options[:maximo]}.value)"
        valor_maximo = "<span id=\"span_msg_valor_maximo_#{options[:id]}\"> </span>"
        if tipo == :inteiro
          options[:onvalidar] = "$('span_msg_valor_maximo_#{options[:id]}').innerHTML = #{options[:maximo]}.value; #{options[:onvalidar]}"
        else
          options[:onvalidar] = "$('span_msg_valor_maximo_#{options[:id]}').innerHTML = formatarParaMoeda(#{options[:maximo]}.value); #{options[:onvalidar]}"
        end
      end
    end

    unless options[:minimo].blank?
      if classes.include? options[:minimo].class
        valor_minimo_js = "#{options[:minimo]}"
        valor_minimo = (tipo == :inteiro ? options[:minimo].to_i : number_to_currency(options[:minimo], {:unit => "", :separator => ",", :precision => options[:casas_decimais], :delimiter => '.'}))
        valor_minimo = (tipo == :inteiro ? options[:minimo].to_i : options[:minimo].reais)
      elsif options[:minimo].is_a? String
        valor_minimo_js = "reaisParaFloat(#{options[:minimo]}.value)"
        valor_minimo = "<span id=\"span_msg_valor_minimo_#{options[:id]}\"> </span>"
        if tipo == :inteiro
          options[:onvalidar] = "$('span_msg_valor_minimo_#{options[:id]}').innerHTML = #{options[:minimo]}.value; #{options[:onvalidar]}"
        else
          options[:onvalidar] = "$('span_msg_valor_minimo_#{options[:id]}').innerHTML = formatarParaMoeda(#{options[:minimo]}.value); #{options[:onvalidar]}"
        end
      end
    end
    
    condicao1 = options[:maximo].blank? ? " true " : "(#{valor_do_input} <= #{valor_maximo_js})"
    condicao2 = options[:minimo].blank? ? " true " : "(#{valor_do_input} >= #{valor_minimo_js})"
    
    if options[:validar_com].blank?
      options[:mensagem] = "<strong> Valor inválido. </strong>"
      options[:mensagem] += "<#{tag} style=\"color: black\"> Valor mínimo: #{valor_minimo}. </#{tag}>" unless options[:minimo].blank?
      options[:mensagem] += "<#{tag} style=\"color: black\"> Valor máximo: #{valor_maximo}. </#{tag}>" unless options[:maximo].blank?
    end
    
    options[:validar_com] = "#{condicao1} && #{condicao2}"
    options[:onkeypress] = "return(formataNumero(event));#{options[:onkeypress]}" if tipo == :inteiro
    
    [:maximo, :minimo, :tipo].each { |o| options.delete(o) }
    
    if tipo == :inteiro
      text_field_tag_com_validacao name, value, options 
    else
      text_field_tag_monetario_com_validacao name, value, options
    end
  end

  #  def select_unidade(object, method, value = nil, html_options = {}, options = {}, opcoes_pesquisa = {}, options_hidden_field = {}, options_campo_controle = {})
  #    if tem_acesso?("#{params[:controller]}Controller".camelize, "Visualizar Dados das Filiais") && unidade_logada.parent_id.blank?
  #      if value
  #        html_options.update({:value => value.descricao_para_pesquisa})
  #        options_hidden_field.update({:value => value.id})
  #        options_campo_controle.update({:value => value.descricao_para_pesquisa})
  #      end
  #
  #      pesquisa_com_auto_complete Unidade, object, method, html_options, options, opcoes_pesquisa, options_hidden_field, options_campo_controle
  #    else
  #      unidade_logada.descricao_para_pesquisa
  #    end
  #  end

  def select_modulo(object, method, html_options = {}, options = {}, opcoes_pesquisa = {}, options_hidden_field = {}, options_campo_controle = {})
#    condicoes = (tem_acesso?("#{params[:controller]}Controller".camelize, "Visualizar Dados das Filiais") && unidade_logada.parent_id.blank?) ? "unidade_id > 0" : "unidade_id = #{unidade_logada.id}"
    condicoes = "unidade_id = #{unidade_logada.id}"
    condicoes += " and (#{opcoes_pesquisa[:condicoes]})" if not opcoes_pesquisa[:condicoes].blank?
    opcoes_pesquisa[:condicoes] = condicoes
    pesquisa_com_auto_complete Modulo, object, method, html_options, options, opcoes_pesquisa, options_hidden_field, options_campo_controle 
  end

#  def number_field_tag(name, value, options = {})
#    options[:onkeypress] = "#{options[:onkeypress]}; return(formataNumero(event));"
#    text_field(name, value, options)
#  end

  
  private

  def div_validacao option_id
    id_div = "div_validacao_#{option_id}"
    "<span id=\"#{id_div}\" class=\"dicatela\" style=\"display: none;\"></span>"
  end
  
  def define_options options
    
    options[:autocomplete] ||= :off
    
    
    display = options[:posicao] == :abaixo ? 'block' : ''
    
    id_div = "div_validacao_#{options[:id]}"
    
    bloco_java_script = ''
    
    bloco_java_script = " if (!(#{options[:validar_com]})) {                           " +
      "   mostraMensagemDeErro('#{options[:mensagem]}', $('#{id_div}'), '#{display}'); " +
      "   eval(\"#{options[:onvalidar]}\")                                             " +
      " } else {                                                                       " +
      "   escondeMensagemDeErro($('#{id_div}'));                                       " +
      " };                              " unless options[:validar_com].blank?
    
    options[:onkeyup] = "#{bloco_java_script}; #{options[:onkeyup]};"
    
    #    options[:onfocus] = " $$('span').each (function(span) { " +
    #      "   if (span.id.substr(0,13) == 'div_validacao')      " +
    #      "     span.hide();                                    " +
    #      " });#{options[:onfocus]}"
    
    options.delete(:onvalidar)
    options.delete(:validar_com)
    options.delete(:mensagem)
    options.delete(:tem_erro)
    options
  end
  
end
