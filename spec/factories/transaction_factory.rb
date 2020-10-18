FactoryBot.define do
  factory :transaction, class: Transaction do
    total { 20 }
    quantity { 3 }
  end
end
