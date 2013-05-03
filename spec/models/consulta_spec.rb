# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Consulta do
 
  describe "consulta" do

    before(:each) do
      @consulta = Consulta.new
      @local = FactoryGirl.create(:local)
      @local.quantidade = 1
    end


    it "deveria validar campos obrigatorios" do
      @consulta.valid?
      @consulta.should have(1).errors_on(:pessoa)
      @consulta.should have(1).errors_on(:convenio)
      @consulta.should have(2).errors_on(:local)
      @consulta.should have(1).errors_on(:atendente)
      @consulta.should have(2).errors_on(:data_hora)
      @consulta.should have(1).errors_on(:valor)
    end

    it "deveria ver se valida se a hora não é 0:00" do
      @consulta.data_hora = "2010-11-10 00:00".to_time
      @consulta.valid?
      @consulta.should have(2).errors_on(:data_hora)
    end

    it "deveria ver se invalida data menor que data de hoje" do
      @consulta.data_hora = "2010-11-10 01:01".to_time
      @consulta.valid?
      @consulta.should have(1).errors_on(:data_hora)
    end

    it "deveria validar local ao marcar consulta" do
      @pessoa = FactoryGirl.create(:pessoa)
      @convenio = FactoryGirl.create(:convenio)
      @atendente = FactoryGirl.create(:atendente)

      consulta = Consulta.new
      consulta.data_hora = DateTime.now + 1.day
      consulta.pessoa = @pessoa
      consulta.valor = 100
      consulta.local = @local
      consulta.convenio = @convenio
      consulta.atendente = @atendente
      
      consulta.valid?
      consulta.save

      @consulta.valor = 100
      @consulta.convenio = @convenio
      @consulta.atendente = @atendente
      @consulta.data_hora = DateTime.now + 1.day
      @consulta.pessoa = @pessoa
      @consulta.local = @local

      @consulta.valid?
      @consulta.should have(1).errors_on(:local)
    end

    it "deveria marcar consulta" do
      @pessoa = FactoryGirl.create(:pessoa)
      @convenio = FactoryGirl.create(:convenio)
      @atendente = FactoryGirl.create(:atendente)

      consulta = Consulta.new
      consulta.data_hora = DateTime.now + 1.day
      consulta.pessoa = @pessoa
      consulta.valor = 100
      consulta.local = @local
      consulta.convenio = @convenio
      consulta.atendente = @atendente

      consulta.valid?
      consulta.save

      @consulta.valor = 100
      @consulta.convenio = @convenio
      @consulta.atendente = @atendente
      @consulta.data_hora = DateTime.now + 2.day
      @consulta.pessoa = @pessoa
      @consulta.local = @local

      @consulta.valid?.should  == true
    end

#    it "deveria validar se data_hora é datetime" do
#      @consulta.data_hora = "abc"
#      @consulta.valid?
      #    @consulta.should have(1).errors_on(:data_hora)
#    end
  end

end