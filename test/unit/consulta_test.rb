require 'test_helper'

class ConsultaTest < ActiveSupport::TestCase
 
  test "testa valida pessoa e data_hora que são obrigatorios" do
    consulta = Consulta.new
    consulta.valid?
    assert consulta.errors[:pessoa]
    assert consulta.errors[:data_hora]
    assert consulta.errors[:convenio]
    assert consulta.errors[:valor]
    assert consulta.errors[:local]

  end
  
  test "testa valida se a hora não é 0:00" do
    consulta = Consulta.new
    consulta.data_hora = "2010-11-10 00:00".to_time
    consulta.valid?
    assert consulta.errors[:data_hora],"data_hora não pode ser zero"
  end

  test "testa se invalida data menor que data de hoje" do
    consulta = Consulta.new
    consulta.data_hora = "2010-11-10 00:00".to_time
    consulta.valid?
    assert(consulta.errors[:data_hora],"data não pode ser menor que hoje")
  end

  test "testa se metodo hora retorna hora" do
    consulta = Consulta.new
    consulta.data_hora = "2010-11-10 12:11".to_time
    assert_equal("12:11",consulta.hora)
  end

  test "se valida local ao marcar consulta" do
    consulta = Consulta.new
    consulta.local = locais(:salinha)
    consulta.valid?
    assert(consulta.errors[:local],"Local ocupado para marcar consultas")
  end

  test "se altera dados da consulta" do
    consulta = consultas(:consulta_para_uma_pessoa)
    consulta.efetuado = false
    consulta.valid?
    assert_nil consulta.errors[:efetuado]
  end

  test "se valida local por horario" do
    consulta = Consulta.new
    consulta.local = locais(:local_para_uma_pessoa)
    consulta.data_hora = "2010-12-08 08:30".to_time
    consulta.valid?
    assert(consulta.errors[:local],"esta lotado, escolha outro")
  end

end
