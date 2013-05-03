# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :consulta do
    data_hora DateTime.now +1.day
    efetuado false
    pessoa {|f| f.association(:pessoa)}
    convenio {|f| f.association(:convenio)}
    local {|f| f.association(:local)}
    valor 1.5
    atendente {|f| f.association(:atendente)}
  end
end
