module ActiveRecordPesquisa
  def self.included(base)
    base.extend ClassMethods
  end
  
#  def descricao_para_pesquisa
#    ''
#  end
  
  module ClassMethods
    # Se utilizar a opção join, é necessário informar os campos de acordo com a tabela
    # <br>Ex: para pesquisar o funcionario pelo nome da pessoa:
    #  pesquisa_por 'funcionarios.id', 'pessoas.nome', :joins => 'funcionarios inner join pessoas on funcionarios.pessoa_id = pessoas.id
    #
    #    Se não fizer isso, pode ocorrer erro, pois os nomes dos campos podem ser iguais nas duas tabelas.
    def pesquisar_por *campos
      joins = {:joins => nil }.update(campos.extract_options!)[:joins]
      @pesquisa = Pesquisa.new(:classe => self, :campos_de_pesquisa => campos, :joins => joins)
      def pesquisa
        @pesquisa
      end
      
      def pesquisar(busca, options = {})
        @pesquisa.busca = busca
        @pesquisa.limite = options[:limite] unless options[:limite].blank?
        @pesquisa.condicoes = options[:condicoes] unless options[:condicoes].blank?
        @pesquisa.contexto = options[:contexto]
        @pesquisa.pesquisar
      end
      
    end
  end
  
end
