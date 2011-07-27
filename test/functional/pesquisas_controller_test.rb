require File.dirname(__FILE__) + '/../test_helper'

class PesquisasControllerTest < ActionController::TestCase

  def setup
    logar
  end

  test "auto_complete_para_pesquisa" do
    @controller = CapturasController.new
    put :index
    @controller = PesquisasController.new
    put :auto_complete_para_pesquisa, :busca => "Aprovada", :conditions => "", :classe => "Status"
    assert_select "ul" do
      assert_select "li", :text => "1 - Aprovada"
    end
  end

  test "busca" do
    @controller = CapturasController.new
    put :index
    @controller = PesquisasController.new
    put :busca, :busca => "Aprovada", :conditions => "", :classe => "Status"
    assert_not_nil assigns(:resultado)
  end

end
