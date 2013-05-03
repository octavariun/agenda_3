# -*- encoding : utf-8 -*-
class Consulta < ActiveRecord::Base
  belongs_to :pessoa
  belongs_to :convenio
  belongs_to :local
  belongs_to :atendente
  attr_accessible :data_consulta ,:hora_consulta, :data_hora, :efetuado, :valor
  

  before_save :atualiza_data_hora
  before_update :atualiza_data_hora
  before_validation :atualiza_data_hora

  validates :pessoa, :convenio, :local, :data_consulta ,:hora_consulta, :atendente, :valor, :presence => true
  validate :valida_quantidade_pessoas_local
  validates_date :data_consulta

  validates_datetime :data_hora, :after => lambda {DateTime.now - 3.hour},
    :after_message => "não pode ser retroativa!"
  validate do |consulta|
    if(consulta.data_hora && consulta.hora == "00:00")
      consulta.errors.add(:data_hora,"Hora não pode ser 00:00")
    end
  end
  
  def atualiza_data_hora
    
    self.data_hora = (data_consulta.strftime("%d/%m/%Y") + " " + hora_consulta.to_s)

   end

  def to_label
    'Consulta'
  end

  def data
    "#{data_hora.year}-#{data_hora.month}-#{data_hora.day}" unless data_hora.blank?
  end
  
  def hora
    "#{data_hora.hour.to_s.rjust(2,"0")}:#{data_hora.min.to_s.rjust(2,"0")}" unless data_hora.blank?
  end

  def valida_quantidade_pessoas_local

    if(local && local.quantidade > 0)
      total_consultas = []
      consultas_local = local.consultas.all

      
      consultas_local.each do |consulta|
        if consulta.data_hora == self.data_hora
          total_consultas << consulta
        end
      end
      quantidade_consultas = total_consultas.length
      quantidade_consultas += 1 unless (consultas_local.detect { |c| c.id == id  })
      if (quantidade_consultas) > local.quantidade
        self.errors.add(:local, "esta lotado, escolha outro")
      end

    else
      self.errors.add(:local,"Local não tem capacidade para nenhum paciente")
    end

  end
end