# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pessoa do
    nome "Han Solo"
    cpf "11111111111"
    telefone "4688044306"
    email "han_solo@estrela_da_morte.com"
    endereco "mileniun falcon"
    numero "15"
    bairro "galaxia perdida"
    cep "00000000"
    cidade {|f| f.association(:cidade)}
  end
end
