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
    logar
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
#  test "testa se será gravada uma nova consulta" do
#    Date.expects(:today).returns("19/11/2010".to_date).at_least(0)
#    assert_difference("Consulta.count") do
#      post :marcar_consulta, :consulta=>{:data => "19/11/2010",:valor => 120,:hora => "10:00", :pessoa_id => pessoas(:cassio).id, :convenio_id => convenios(:unimed).id,:local_id => locais(:sauna).id}
#    end
#
#    assert_equal "10:00",Consulta.last.data_hora.hora
#    assert_equal pessoas(:cassio),Consulta.last.pessoa
#    assert_equal convenios(:unimed).id,Consulta.last.convenio.id
#
#
#  end
#
#  test "testa se convenio esta sendo gravado" do
#    post :gravar_convenio, :consulta_id => consultas(:consulta_1).id, :convenio_id => convenios(:pasc).id
#    assert_equal convenios(:pasc), Consulta.find(consultas(:consulta_1).id).convenio, "Não alterou o convenio"
#  end
end
