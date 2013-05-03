# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :atendente do
    nome "Camilo"
    usuario {|f| f.association(:usuario)}
    cargo {|f| f.association(:cargo)}
  end
end
