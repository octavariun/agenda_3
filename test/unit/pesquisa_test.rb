require File.dirname(__FILE__) + '/../test_helper'

class PesquisaTest < ActiveSupport::TestCase

  def test_se_traz_pessoas_corretamente_por_id
    contexto = contextos(:contexto_unidade_master)
    pesquisa = Pesquisa.new(:contexto => contexto, :busca => '1', :classe => 'pessoa', :campos_de_pesquisa => ['id'])
    objetos = pesquisa.pesquisar
    assert_equal 'Henrique Cido', objetos[0].nome, 'Pessoa Carregada Incorretamente'
  end

  def test_se_traz_pessoas_corretamente_por_nome
    contexto = contextos(:contexto_unidade_master)
    pesquisa = Pesquisa.new(:contexto => contexto, :busca => 'rique', :classe => 'pessoa', :campos_de_pesquisa => ['nome'])
    objetos = pesquisa.pesquisar
    assert_equal 'Henrique Cido', objetos[0].nome, 'Pessoa Carregada Incorretamente'
  end

  def test_se_traz_pessoas_corretamente_por_id_e_nome
    contexto = contextos(:contexto_unidade_master)
    pesquisa = Pesquisa.new(:contexto => contexto, :busca => '2', :classe => 'pessoa', :campos_de_pesquisa => ['id','nome'])
    objetos = pesquisa.pesquisar
    assert_equal 'Luter King', objetos[0].nome, 'Pessoa Carregada Incorretamente'
    contexto = contextos(:contexto_unidade_master)
    pesquisa = Pesquisa.new(:contexto => contexto, :busca => 'r kin', :classe => 'pessoa', :campos_de_pesquisa => ['id','nome'])
    objetos = pesquisa.pesquisar
    assert_equal 'Luter King', objetos[0].nome, 'Pessoa Carregada Incorretamente'
  end

  def test_se_retorna_array_vazio_quando_nao_acha_nada
    contexto = contextos(:contexto_unidade_master)
    pesquisa = Pesquisa.new(:contexto => contexto, :busca => 'qoweiruqoweiruoqwirueqwoieruqoweiruwqoui',
      :classe => 'pessoa', :campos_de_pesquisa => ['id', 'nome'])
    pesquisa.pesquisar
    assert_equal [], pesquisa.resultados, "nao veio vazio quando deveria"
  end

  def test_busca_vazia
    contexto = contextos(:contexto_unidade_master)
    pesquisa = Pesquisa.new(:contexto => contexto, :busca => '', :classe => 'pessoa', :campos_de_pesquisa => ['id', 'nome'])
    pesquisa.pesquisar
    assert_equal [], pesquisa.resultados, "nao veio vazio quando deveria"
  end

  def test_busca_com_condicoes
    contexto = contextos(:contexto_unidade_master)
    pesquisa = Pesquisa.new(:contexto => contexto, :busca => '2', :classe => 'pessoa', :campos_de_pesquisa => ['id'], :condicoes =>"nome = 'Luter King'")
    objetos = pesquisa.pesquisar
    assert_equal Pessoa.find(2) , objetos[0], "Deu pau com conditions"
    contexto = contextos(:contexto_unidade_master)
    pesquisa = Pesquisa.new(:contexto => contexto, :busca => 'ute', :classe => 'pessoa', :campos_de_pesquisa => ['nome'], :condicoes =>"id > 1")
    objetos = pesquisa.pesquisar
    assert_equal Pessoa.find(:all, :conditions => "upper(nome) like upper('%ute%') and id > 1"), objetos, "Deu pau com conditions"
  end

  def test_se_busca_retorna_classe_correta
    contexto = contextos(:contexto_unidade_master)
    pesquisa = Pesquisa.new(:contexto => contexto, :busca => '2', :classe => 'pessoa', :campos_de_pesquisa => ['id'])
    pesquisa.pesquisar
    assert_instance_of Pessoa, pesquisa.resultados[0], "Não criou com classe corretamente"
  end

  def test_se_levanta_excecao_quando_busca_com_classe_nao_active_record
    contexto = contextos(:contexto_unidade_master)
    pesquisa = Pesquisa.new(:contexto => contexto, :busca => '2', :classe => 'string', :campos_de_pesquisa => ['id'])
    assert_raise ArgumentError do
      pesquisa.pesquisar
    end
  end

  def test_se_pesquisa_com_joins
    contexto = contextos(:contexto_unidade_master)
    pesquisa = Pesquisa.new(:contexto => contexto, :busca => 'Henrique', :classe => 'funcionario', :campos_de_pesquisa => ['funcionarios.id', 'pessoas.nome'], :joins => 'inner join pessoas on funcionarios.pessoa_id = pessoas.id')
    pesquisa.pesquisar
    assert_equal 'Henrique Cido', pesquisa.resultados[0].pessoa.nome, "Não pesquisou com Join"
  end

  def test_se_nao_retorna_funcionario_inativo
    contexto = contextos(:contexto_unidade_master)
    pesquisa = Pesquisa.new(:contexto => contexto, :busca => 'Inativo', :classe => 'funcionario', :campos_de_pesquisa => ['funcionarios.id', 'pessoas.nome'], :joins => 'inner join pessoas on funcionarios.pessoa_id = pessoas.id')
    pesquisa.pesquisar
    assert_nil pesquisa.resultados[0], "retornou pessoa inativa"
  end

  def test_se_nao_retorna_funcionario_inativo_passando_id
    contexto = contextos(:contexto_unidade_master)
    pesquisa = Pesquisa.new(:contexto => contexto, :busca => '8', :classe => 'funcionario', :campos_de_pesquisa => ['funcionarios.id', 'pessoas.nome'], :joins => 'inner join pessoas on funcionarios.pessoa_id = pessoas.id')
    pesquisa.pesquisar
    assert_nil pesquisa.resultados[0], "retornou pessoa inativa"
  end

  def test_pesquisar_passando_contexto
    contexto = contextos(:contexto_unidade_fistaile)
    pesquisa = Pesquisa.new(:contexto => contexto, :busca => '10', :classe => 'funcionario', :campos_de_pesquisa => ['funcionarios.id', 'pessoas.nome'], :joins => 'inner join pessoas on funcionarios.pessoa_id = pessoas.id')
    pesquisa.pesquisar
    assert_equal "LukeGui", pesquisa.resultados.first.pessoa.nome

    contexto = contextos(:contexto_unidade_master)
    pesquisa = Pesquisa.new(:contexto => contexto, :busca => '10', :classe => 'funcionario', :campos_de_pesquisa => ['funcionarios.id', 'pessoas.nome'], :joins => 'inner join pessoas on funcionarios.pessoa_id = pessoas.id')
    pesquisa.pesquisar
    assert pesquisa.resultados.blank?
  end

  def test_pesquisar_com_tabela_sem_contexto
    contexto = contextos(:contexto_unidade_fistaile)
    pesquisa = Pesquisa.new(:contexto => contexto, :busca => '1', :classe => 'status', :campos_de_pesquisa => ['status.id'])
    pesquisa.pesquisar
    assert_equal "Aprovada", pesquisa.resultados.first.descricao
  end

  test "se ignora conditions passando sql injection (cql injécxio)" do
    contexto = contextos(:contexto_unidade_master)

    %w(create delete update drop where select alter CREATE DelEte drOp ;).each do |palavra|

      pesquisa = Pesquisa.new(:contexto => contexto, :busca => '1', :classe => 'pessoa', :campos_de_pesquisa => ['id'], :condicoes => palavra)

      assert_raise SQLException do
        pesquisa.pesquisar
      end
    end
  end

end
