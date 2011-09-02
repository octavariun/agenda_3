require 'test_helper'

class ConsultasControllerTest < ActionController::TestCase


#  test "testa se o index retorna um array de consultas e verifa se o assigns é a data de hoje" do
#    Date.expects(:today).returns("2010-11-19".to_date).at_least(0)
#    get :index
#    consultas = assigns(:consultas)
#    assert_equal Date.today,assigns(:data)
#    assert(consultas.is_a?(Array))
#    assert(consultas.size > 0, "consulta maior que zero")
#    consultas.each do |consulta|
#      assert_equal(Consulta, consulta.class)
#    end
#  end

  test "Testa se ao clicar no efetuado ja salva no banco" do
#    logar
    post :gravar_efetuado, :consulta_id => consultas(:consulta_1).id, :efetuado => false
    assert_equal false, Consulta.find(consultas(:consulta_1).id).efetuado, "Não alterou o efetuado"
  end

#  test "testa se ao clicar no botão filtrar ele filtra as consultas pela data correspondente" do
#    post :alterar_dia, :data => "18/11/2010"
#    consultas = assigns(:consultas)
#    assert(consultas.is_a?(Array))
#    assert_equal "18/11/2010".to_date, assigns(:data)
#    assert(consultas.size > 0, "consulta maior que zero")
#    consultas.each do |consulta|
#      assert_equal(Consulta, consulta.class)
#      assert_equal("2010-11-18".to_date,consulta.data_hora.to_date)
#    end
#
#  end
#
  test "testa se será gravada uma nova consulta" do
    Date.expects(:today).returns("2010-08-22 12:00".to_time).at_least_once
    
    assert_difference("Consulta.count") do
      post :create, :record=>{:data_hora => Date.today,:valor => "120", :pessoa => "1", :convenio => "1",:local => "1"}
    end

    assert_equal "12:0",Consulta.last.hora
    assert_equal pessoas(:luke),Consulta.last.pessoa
    assert_equal convenios(:unimed).id,Consulta.last.convenio.id


  end
end
