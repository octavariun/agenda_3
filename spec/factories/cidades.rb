FactoryGirl.define do
  factory :cidade do
    nome "Marmeleiro"
    estado {|f| f.association(:estado)}
  end
end
