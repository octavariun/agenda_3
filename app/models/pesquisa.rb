class Pesquisa < ActiveRecord::Base
  
  attr_accessor :classe, :busca, :campos_de_pesquisa, :condicoes, :pagina, :limite, :joins, :contexto
  attr_reader :resultados

  def initialize(atributos)
    @classe = atributos[:classe]
    @busca = atributos[:busca]
    @campos_de_pesquisa = atributos[:campos_de_pesquisa]
    @condicoes = atributos[:condicoes]
    @joins = atributos[:joins]
    @pagina = !atributos[:pagina].blank? ? atributos[:pagina] : 1
    @limite = !atributos[:limite].blank? ? atributos[:limite] : 20
    @contexto = atributos[:contexto]
    @resultados = []
  end
  
  def pesquisar
    classe_pesquisa = classe.to_s.camelize.constantize
    inativo = classe_pesquisa.new.attributes.include?"inativo" rescue false
    raise ArgumentError, "Classe de pesquisa inválida" unless classe_pesquisa < ActiveRecord::Base
    unless busca.blank?
      campos_de_pesquisa.each do |campo|

        if classe_pesquisa.column_names.include?("contexto_id") && contexto
          @resultados = contexto.send(classe_pesquisa.to_s.pluralize.underscore).paginate(:page => pagina, :per_page => limite, :conditions => conditions(campo.to_s,inativo), :joins => @joins)
        else
          @resultados = classe_pesquisa.paginate(:page => pagina, :per_page => limite, :conditions => conditions(campo.to_s,inativo), :joins => @joins)
        end
        
        if @resultados.length > 0 then
          return @resultados
        end
      end
    end
    @resultados
  end
  
  private
  
  def conditions(campo,inativo)

    unless condicoes.blank?

      palavras_proibidas = %w(create delete update drop where select alter ;)

      palavras_proibidas.each do |palavra|
        if condicoes.downcase.include?(palavra)
          raise SQLException
        end
      end
      
      condicao = "and #{condicoes}"
    end
    if busca.inteiro?
      if inativo
        conditions = ["(inativo <> (?) or inativo is null) and #{campo} = ? #{condicao}",true, "#{busca}"]
      else
        conditions = ["#{campo} = ? #{condicao}", "#{busca}"]
      end
    else
      if inativo
        conditions = ["(inativo <> (?) or inativo is null) and upper(cast(#{campo} as varchar)) like upper(?) #{condicao}", true, "%#{busca}%"]
      else
        conditions = ["upper(cast(#{campo} as varchar)) like upper(?) #{condicao}", "%#{busca}%"]
      end
    end
    conditions
  end
  
end

class SQLException < Exception; 
  
end
