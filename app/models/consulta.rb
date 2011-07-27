class Consulta < ActiveRecord::Base
  belongs_to :pessoa
  belongs_to :convenio
  belongs_to :local


  def to_label
    'Consulta'
  end

  validates_presence_of :pessoa, :data_hora, :convenio, :valor, :local
  
  validate :valida_quantidade_pessoas_local
  validate do |consulta|
    if(consulta.data_hora && consulta.hora == "00:00")
      consulta.errors.add(:data_hora,"Hora invalida")
    end
  end
  validate do |consulta|
    if(consulta.data_hora && consulta.data_hora < Date.today && consulta.new_record?)
      consulta.errors.add(:data_hora,"Não pode ser data retroativa")
    end
  end

  def hora
    "#{data_hora.hour}:#{data_hora.min}"
  end

  def valida_quantidade_pessoas_local
    if(local)
      consultas_local = local.consultas.all :conditions => ["data_hora = ? ", self.data_hora]
      quantidade_consultas = consultas_local.length
      quantidade_consultas += 1 unless (consultas_local.detect { |c| c.id == id  })
      if (quantidade_consultas) > local.quantidade
        self.errors.add(:local, "esta lotado, escolha outro")
      end
    end
  end
end
